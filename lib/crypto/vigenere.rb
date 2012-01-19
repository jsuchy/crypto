require 'crypto/caesar'

module Crypto
  class Vigenere
    def initialize(keyword)
      @keyword = keyword.downcase
    end

    def encrypt(plaintext)
      index = 0
      plaintext.each_char.collect do |letter|
        shift_char = index % @keyword.size
        shift = @keyword[shift_char].unpack('c').first - Crypto::Caesar::A_VALUE
        cipher = Crypto::Caesar.new(shift)
        crypted_letter = cipher.encrypt(letter)
        index += 1
        crypted_letter
      end.join
    end
  end
end
