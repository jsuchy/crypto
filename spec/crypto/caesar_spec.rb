require_relative '../../lib/crypto/caesar'

describe Crypto::Caesar do
  it "encrypts single characters" do
    Crypto::Caesar.encrypt("A", "a").should == "A"
    Crypto::Caesar.encrypt("a", "A").should == "A"
    Crypto::Caesar.encrypt("B", "a").should == "B"
    Crypto::Caesar.encrypt("Z", "a").should == "Z"
    Crypto::Caesar.encrypt("A", "z").should == "Z"
    Crypto::Caesar.encrypt("B", "z").should == "A"
  end

  it "encrypts multiple character strings" do
    Crypto::Caesar.encrypt("A", "abc").should == "ABC"
    Crypto::Caesar.encrypt("A", "ABC").should == "ABC"
    Crypto::Caesar.encrypt("B", "abc").should == "BCD"
    Crypto::Caesar.encrypt("Y", "XyZ").should == "VWX"
  end
end
