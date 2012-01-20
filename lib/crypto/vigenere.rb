require 'crypto/caesar'

module Crypto
  class Vigenere
    def initialize(keyword)
      @keyword = keyword.downcase
    end

    def self.generate_square
      letters = ("A".."Z").to_a

      square = ["  | #{('a'..'z').to_a.join(' | ')}"]

      letters.each_with_index do |letter, index|
        cipher = Crypto::Caesar.new(index)
        cipher_alphabet = cipher.cipher_alphabet.join(" | ")
        square << "#{letter} | #{cipher_alphabet}"
      end
      square
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
