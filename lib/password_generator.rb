# coding: us-ascii
# Copyright (c) 2013 Kenichi Kamiya

require 'securerandom'
require 'optionalargument'

require_relative 'password_generator/version'

module PasswordGenerator

  DOWNCASES = ('a'..'z').map(&:freeze).freeze
  UPPERCASES = ('A'..'Z').map(&:freeze).freeze
  NUMBERS = ('0'..'9').map(&:freeze).freeze
  SYMBOLS = [*'!'..'/', *':'..'@', *'['..'`', *'{'..'~'].each(&:freeze).freeze
  WHITESPACE = ' '.freeze

  class << self

    GENERATE_OptArg = OptionalArgument.define {
      opt :avoid_downcases, default: false, condition: BOOLEAN?
      opt :avoid_uppercases, default: false, condition: BOOLEAN?
      opt :avoid_numbers, default: false, condition: BOOLEAN?
      opt :avoid_symbols, default: false, condition: BOOLEAN?
      opt :avoid_whitespace, default: true, condition: BOOLEAN?
    }

    # @param length [Fixnum]
    # @param options [Hash]
    # @option options [Boolean] :avoid_downcases
    # @option options [Boolean] :avoid_uppercases
    # @option options [Boolean] :avoid_numbers
    # @option options [Boolean] :avoid_symbols
    # @option options [Boolean] :avoid_whitespace
    # @return [String]
    def generate(length, options={})
      options = GENERATE_OptArg.parse options
      chars = characters_for(options).freeze

      charlen = chars.length

      # `Array#sample` accepts random generator via optional-argument.
      # But the feature/syntax makes my anxiety :(
      length.times.map{chars.fetch(SecureRandom.random_number(charlen))}.join
    end

    private

    # @param options [GENERATE_OptArg]
    # @return [Array<String>]
    def characters_for(options)
      chars = []
      chars.concat(DOWNCASES) unless options.avoid_downcases
      chars.concat(UPPERCASES) unless options.avoid_uppercases
      chars.concat(NUMBERS) unless options.avoid_numbers
      chars.concat(SYMBOLS) unless options.avoid_symbols
      chars.push(WHITESPACE) unless options.avoid_whitespace

      unless chars.length >= 2
        raise ArgumentError, "using character-list is too short: #{chars.inspect}"
      end

      chars
    end

  end

end