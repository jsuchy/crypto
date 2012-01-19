require 'crypto/caesar'

describe Crypto::Caesar do
  it "encrypts with key of 0" do
    cipher = Crypto::Caesar.new(0)
    cipher.encrypt("a").should == "A"
    cipher.encrypt("A").should == "A"
    cipher.encrypt("abcd").should == "ABCD"
  end

  it "encrypts with key of 3" do
    cipher = Crypto::Caesar.new(3)
    cipher.encrypt("a").should == "D"
    cipher.encrypt("A").should == "D"
    cipher.encrypt("abcd").should == "DEFG"
  end

  it "encrypts with key of 25" do
    cipher = Crypto::Caesar.new(25)
    cipher.encrypt("a").should == "Z"
    cipher.encrypt("A").should == "Z"
    cipher.encrypt("abcd").should == "ZABC"
    cipher.encrypt("XaVT").should == "WZUS"
  end

  it "displays the plaintext to ciphertext transformation" do
    cipher = Crypto::Caesar.new(0)
    cipher.transformation.should == "abcdefghijklmnopqrstuvwxyz\nABCDEFGHIJKLMNOPQRSTUVWXYZ"

    cipher = Crypto::Caesar.new(2)
    cipher.transformation.should == "abcdefghijklmnopqrstuvwxyz\nCDEFGHIJKLMNOPQRSTUVWXYZAB"
  end

  it "strips out spaces" do
    cipher = Crypto::Caesar.new(0)
    cipher.encrypt("a b c d e ").should == "ABCDE"
  end
end
