require 'spec_helper'
require 'caeser_cipher'

describe CaeserCipher do

  context "cipher with shift 3" do

    before(:each) do
      @cipher = CaeserCipher.new(3)
    end
    
    it "encrypts all letters" do
      @cipher.encrypt("A").should == "D"
      @cipher.encrypt("B").should == "E"
      @cipher.encrypt("C").should == "F"
      @cipher.encrypt("K").should == "N"
      @cipher.encrypt("T").should == "W"
      @cipher.encrypt("W").should == "Z"
      @cipher.encrypt("X").should == "A"
      @cipher.encrypt("Y").should == "B"
      @cipher.encrypt("Z").should == "C"
    end
    
    it "decrypts all letters" do
      @cipher.decrypt("D").should == "A"
      @cipher.decrypt("E").should == "B"
      @cipher.decrypt("F").should == "C"
      @cipher.decrypt("N").should == "K"
      @cipher.decrypt("W").should == "T"
      @cipher.decrypt("Z").should == "W"
      @cipher.decrypt("A").should == "X"
      @cipher.decrypt("B").should == "Y"
      @cipher.decrypt("C").should == "Z"
    end

  end
  
  
  context "decrypt" do

    it "ciphers with a shift of 0" do
      @cipher = CaeserCipher.new(0)

      @cipher.decrypt("A").should == "A"
      @cipher.decrypt("B").should == "B"
      @cipher.decrypt("C").should == "C"
      @cipher.decrypt("Z").should == "Z"
    end

    it "ciphers with a shift of 1" do
      @cipher = CaeserCipher.new(1)

      @cipher.decrypt("A").should == "Z"
      @cipher.decrypt("B").should == "A"
      @cipher.decrypt("C").should == "B"
      @cipher.decrypt("Z").should == "Y"    
    end

    it "ciphers with a shift of 2" do
      @cipher = CaeserCipher.new(2)

      @cipher.decrypt("A").should == "Y"
      @cipher.decrypt("B").should == "Z"
      @cipher.decrypt("C").should == "A"
      @cipher.decrypt("Z").should == "X"        
    end

    it "ciphers with a shift of 26" do
      @cipher = CaeserCipher.new(26)

      @cipher.decrypt("A").should == "A"
      @cipher.decrypt("B").should == "B"
      @cipher.decrypt("C").should == "C"
      @cipher.decrypt("Z").should == "Z"    
    end

    it "ciphers with a shift of 52" do
      @cipher = CaeserCipher.new(52)

      @cipher.decrypt("A").should == "A"
    end
  end
  
  context "encrypt" do

    it "encrypts with a shift of 0" do
      @cipher = CaeserCipher.new(0)

      @cipher.encrypt("A").should == "A"
      @cipher.encrypt("B").should == "B"
      @cipher.encrypt("C").should == "C"
      @cipher.encrypt("Z").should == "Z"
    end

    it "encrypts with a shift of 5" do
      @cipher = CaeserCipher.new(5)

      @cipher.encrypt("F").should == "K"
      @cipher.encrypt("G").should == "L"
      @cipher.encrypt("H").should == "M"
      @cipher.encrypt("Z").should == "E"
    end

    it "encrypts with a shift of 26" do
      @cipher = CaeserCipher.new(26)

      @cipher.encrypt("A").should == "A"
    end

    it "encrypts with a shift of 52" do
      @cipher = CaeserCipher.new(52)

      @cipher.encrypt("A").should == "A"
    end

    it "encrypts with a shift of -1" do
      @cipher = CaeserCipher.new(-1)

      @cipher.encrypt("A").should == "Z"
    end

    it "checks homework problems" do
      @cipher = CaeserCipher.new(3)

      @cipher.encrypt("KEEPTHISSECRET").should == "NHHSWKLVVHFUHW"
    end

  end
  
end
