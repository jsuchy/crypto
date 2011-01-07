class CaeserCipher
  ASCII_A = 65
  ASCII_Z = 90
  
  def initialize(shift)
    @shift = shift
  end
  
  def encrypt(string)
    encrypted_string = ""
    string.each_byte do |b|
      if b + @shift > ASCII_Z
        b -= 26
      end
      encrypted_string << (b + @shift).chr
    end
    
    return encrypted_string
  end

  def decrypt(string)
    decrypted_string = ""
    string.each_byte do |b| 
      if b - @shift < ASCII_A
        b += 26
      end
      decrypted_string << (b - @shift).chr
    end
    
    return decrypted_string
  end
end
