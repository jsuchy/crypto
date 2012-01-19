module Crypto
  class Substitution
    def self.generate
      ("A".."Z").to_a.shuffle.join(" ")
    end
  end
end
