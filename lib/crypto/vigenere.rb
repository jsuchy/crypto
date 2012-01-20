require 'crypto/caesar'

module Crypto
  class Vigenere
    def initialize(keyword)
      @keyword = keyword.downcase
    end

    def encrypt(plaintext)
      index = 0
      plaintext.gsub(/\W+|\d+/, '').each_char.collect do |letter|
        shift_char = index % @keyword.size
        index += 1
        Crypto::Caesar.new(_shift(shift_char)).encrypt(letter)
      end.join
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

    def _shift(char)
      @keyword[char].unpack('c').first - Crypto::Caesar::A_VALUE
    end
  end
end
