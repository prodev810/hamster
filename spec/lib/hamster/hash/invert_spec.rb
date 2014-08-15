require "spec_helper"
require "hamster/hash"

describe Hamster::Hash do
  describe "#invert" do
    let(:hash) { Hamster.hash(a: 3, b: 2, c: 1) }

    it "uses the existing keys as values and values as keys" do
      hash.invert.should eql(Hamster.hash(3 => :a, 2 => :b, 1 => :c))
    end

    it "will select one key/value pair among multiple which have same value" do
      [Hamster.hash(1 => :a),
       Hamster.hash(1 => :b),
       Hamster.hash(1 => :c)].should include(Hamster.hash(a: 1, b: 1, c: 1).invert)
    end
  end
end