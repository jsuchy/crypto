require 'crypto/letter_frequencies'

describe "LetterFrequencies" do
  it "adds up to around 100" do
    sum_of_frequencies = Crypto::LetterFrequencies.inject(0) do |acc, arr|
      acc += arr[1]
    end
    difference = (sum_of_frequencies - 100).abs
    difference.should <= 0.3
  end
end
