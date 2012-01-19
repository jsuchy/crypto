module Crypto
  class Caesar
    A_VALUE = "a".unpack('c').first
    Z_VALUE = "z".unpack('c').first

    attr_accessor :shift

    def initialize(shift=3)
      @shift = shift
    end

    def encrypt(plaintext)
      plaintext = plaintext.gsub(/\s/,'')
      plaintext.downcase.each_char.collect do |plainletter|
        _encrypt(plainletter)
      end.join
    end

    def transformation
      letters = ("a".."z").to_a
      letters << "\n"
      ("a".."z").to_a.each do |letter|
        letters << _encrypt(letter)
      end
      letters.join
    end

    def _encrypt(letter)
      plain_letter_index = letter.unpack('c').first - A_VALUE
      shifted_encoding = (plain_letter_index + @shift) % 26
      cipherval = shifted_encoding + A_VALUE
      cipherval.chr.upcase
    end
  end
end
