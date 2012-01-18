module Crypto
  class Caesar
    A_VALUE = "a".unpack('c').first
    Z_VALUE = "z".unpack('c').first

    attr_accessor :shift

    def initialize(shift=3)
      @shift = shift + A_VALUE
    end

    def encrypt(plaintext)
      plaintext = plaintext.gsub(/\s/,'')
      plaintext.downcase.each_char.collect do |plainletter|
        encrypt_plaintext(plainletter)
      end.join
    end

    def encrypt_plaintext(letter)
      cipherval = letter.unpack('c').first + @shift - A_VALUE
      if cipherval > Z_VALUE
        cipherval -= (Z_VALUE - A_VALUE) + 1
      end

      cipherval.chr.upcase
    end

    def transformation
      letters = ("a".."z").to_a
      letters << "\n"
      ("a".."z").to_a.each do |letter|
        letters << encrypt_plaintext(letter)
      end
      letters.join
    end
  end
end
