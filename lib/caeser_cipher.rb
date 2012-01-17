class CaeserCipher
  ASCII_A = 65
  ASCII_Z = 90
  
  def initialize(shift)
    @shift = shift
  end
  
  def shift(b, shift_direction)
    value = b + ((@shift % 26) * shift_direction)
    value -= 26 if value > ASCII_Z
    value += 26 if value < ASCII_A
    return value.chr
  end
  
  def shift_string(string, shift_direction)
    shifted_string = ""
    string.each_byte do |b|
      shifted_string << shift(b, shift_direction)
    end
    
    return shifted_string
  end
  
  def encrypt(string)
    shift_string(string, 1)
  end

  def decrypt(string)
    shift_string(string, -1)
  end
end
