# coding: us-ascii
# password_generator - A generator of daily passwords
# Copyright (c) 2013 Kenichi Kamiya

require 'securerandom' # Don't consider unsupported SecureRandom
require 'optionalargument'

require_relative 'password_generator/version'

module PasswordGenerator

  DOWNCASES = ('a'..'z').map(&:freeze).freeze
  UPPERCASES = ('A'..'Z').map(&:freeze).freeze
  NUMBERS = ('0'..'9').map(&:freeze).freeze
  SYMBOLS = [*'!'..'/', *':'..'@', *'['..'`', *'{'..'~'].each(&:freeze).freeze
  WHITESPACE = ' '.freeze

  GENERATE_OptArg = OptionalArgument.define {
    opt :avoid_downcases, default: false, condition: BOOLEAN?
    opt :avoid_uppercases, default: false, condition: BOOLEAN?
    opt :avoid_numbers, default: false, condition: BOOLEAN?
    opt :avoid_symbols, default: false, condition: BOOLEAN?
    opt :avoid_whitespace, default: true, condition: BOOLEAN?
  }

  class Generator

    attr_reader :length, :options, :letters

    # @param length [Fixnum]
    # @param options [GENERATE_OptArg]
    def initialize(length, options)
      @length, @options = length, options
      @letters = generate_letters.freeze
    end

    # @return [String]
    def generate
      llen = letters.length

      # `Array#sample` accepts random generator.
      # But the feature/syntax makes my anxiety :(
      length.times.map{letters.fetch(SecureRandom.random_number(llen))}.join
    end

    private

    # @return [Array<String>]
    def generate_letters
      [].tap {|list|
        list.concat(DOWNCASES) unless options.avoid_downcases
        list.concat(UPPERCASES) unless options.avoid_uppercases
        list.concat(NUMBERS) unless options.avoid_numbers
        list.concat(SYMBOLS) unless options.avoid_symbols
        list.push(WHITESPACE) unless options.avoid_whitespace

        unless list.length >= 2
          raise ArgumentError, "using letter-list is too short: #{list.inspect}"
        end
      }
    end

  end

  if respond_to? :private_constant
    private_constant :Generator
  end

  class << self

    # @param length [Fixnum, #to_int]
    # @param options [Hash]
    # @option options [Boolean] :avoid_downcases
    # @option options [Boolean] :avoid_uppercases
    # @option options [Boolean] :avoid_numbers
    # @option options [Boolean] :avoid_symbols
    # @option options [Boolean] :avoid_whitespace
    # @return [String]
    def generate(length, options={})
      length = length.to_int
      unless length >= 1
        raise ArgumentError, "too small length thrown: #{length.inspect}"
      end
      options = GENERATE_OptArg.parse options

      Generator.new(length, options).generate
    end

  end

end