# coding: utf-8

require_relative 'spec_helper'

describe PasswordGenerator do
  describe '.generate' do
    context "with length argument" do
      it "raises an ArgumentError when the length is lesser equal 0" do
        expect{PasswordGenerator.generate(0)}.to raise_error(ArgumentError)
        expect{PasswordGenerator.generate(-8)}.to raise_error(ArgumentError)
      end

      it "returns a String" do
        expect(PasswordGenerator.generate(1)).to be_an_instance_of(String)
      end

      context "the returned String" do
        it "'s length equal as the first argument" do
          expect(PasswordGenerator.generate(1).length).to eq(1)
          expect(PasswordGenerator.generate(8).length).to eq(8)
          expect(PasswordGenerator.generate(256).length).to eq(256)
        end

        it "is not frozen" do
          expect(PasswordGenerator.generate(1).frozen?).to be_false
        end
      end

      context "without options" do
        it "builded mixed characters without whitespace" do
          ret = PasswordGenerator.generate(512)
          expect(ret).to match(/[a-z]/)
          expect(ret).to match(/[A-Z]/)
          expect(ret).to match(/\d/)
          expect(ret).to match(/[^a-zA-Z0-9 ]/)
          expect(ret).not_to match(/ /)
        end
      end

      context "with options" do
        it "builded only downcases if enabled only downcases" do
          expect(PasswordGenerator.generate(512, avoid_downcases: false,
                                                 avoid_uppercases: true,
                                                 avoid_numbers: true,
                                                 avoid_symbols: true,
                                                 avoid_whitespace: true                                  
            )).
          to match(/\A[a-z]{512}\z/)
        end

        it "builded only uppercases if enabled only uppercases" do
          expect(PasswordGenerator.generate(512, avoid_downcases: true,
                                                 avoid_uppercases: false,
                                                 avoid_numbers: true,
                                                 avoid_symbols: true,
                                                 avoid_whitespace: true                                  
            )).
          to match(/\A[A-Z]{512}\z/)
        end

        it "builded only numbers if enabled only numbers" do
          expect(PasswordGenerator.generate(512, avoid_downcases: true,
                                                 avoid_uppercases: true,
                                                 avoid_numbers: false,
                                                 avoid_symbols: true,
                                                 avoid_whitespace: true                                
            )).
          to match(/\A\d{512}\z/)
        end

        it "builded only symbols if enabled only symbols" do
          expect(PasswordGenerator.generate(512, avoid_downcases: true,
                                                 avoid_uppercases: true,
                                                 avoid_numbers: true,
                                                 avoid_symbols: false,
                                                 avoid_whitespace: true                                  
            )).
          to match(/\A[^a-zA-Z0-9 ]{512}\z/)
        end

        it "builded mixed characters with whitespace if disabled avoiding whitespace" do
          ret = PasswordGenerator.generate(512, avoid_whitespace: false)
          expect(ret).to match(/[a-z]/)
          expect(ret).to match(/[A-Z]/)
          expect(ret).to match(/\d/)
          expect(ret).to match(/[^a-zA-Z0-9]/)
          expect(ret).to match(/ /)
        end
      end
    end

    context "without arguments" do
      it "raises an ArgumentError" do
        expect{PasswordGenerator.generate}.to raise_error(ArgumentError)
      end
    end
  end
end