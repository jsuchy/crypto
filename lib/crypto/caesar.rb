module Crypto
  class Caesar
    A_VALUE = "a".unpack('c').first
    Z_VALUE = "z".unpack('c').first

    def self.encrypt(key, plaintext)
      offset = key.downcase.unpack('c').first

      plaintext.downcase.each_char.collect do |plainletter|
        cipherval = plainletter.unpack('c').first + offset - A_VALUE
        if cipherval > Z_VALUE
          cipherval -= (Z_VALUE - A_VALUE) + 1
        end

        cipherval.chr.upcase
      end.join
    end
  end
end
