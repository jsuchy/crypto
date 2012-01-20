require 'crypto/vigenere'

describe Crypto::Vigenere do
  it "encrypts with keyword of A" do
    cipher = Crypto::Vigenere.new("A")
    cipher.encrypt("a").should == "A"
    cipher.encrypt("A").should == "A"
    cipher.encrypt("abcd").should == "ABCD"
  end

  it "encrypts with a keyword of B" do
    cipher = Crypto::Vigenere.new("B")
    cipher.encrypt("a").should == "B"
    cipher.encrypt("A").should == "B"
    cipher.encrypt("abcd").should == "BCDE"
  end

  it "encrypts with a keyword of WHITE" do
    cipher = Crypto::Vigenere.new("WHITE")
    cipher.encrypt("diverttroops").should == "ZPDXVPAZHSLZ"
    cipher.encrypt("di  ver  t,t3434roops").should == "ZPDXVPAZHSLZ"
  end

  it "encrypts a Babbage quote with his last name" do
    cipher = Crypto::Vigenere.new("CHARLES")
    cipher.encrypt("decipheringisinmyopiniononeofthemostfascinatingofarts").should == "FLCZALWTPNXTWAPTYFAMFKVNFYIGHAHVXSKVMAJNMFCAIERSXCYTJ"
  end
end
