# coding: utf-8

require_relative 'spec_helper'

describe PasswordGenerator do
  describe '.generate' do
    context "without arguments" do
      it "raises an ArgumentError" do
        expect{PasswordGenerator.generate}.to raise_error(ArgumentError)
      end
    end

    context "without options" do
      it "returns a String" do
        expect(PasswordGenerator.generate(1)).to be_an_instance_of(String)
      end

      specify "the length equal as the first argument" do
        expect(PasswordGenerator.generate(8).length).to eq(8)
      end
    end
  end
end