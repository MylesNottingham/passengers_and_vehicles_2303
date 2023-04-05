# require "rspec"
require "./lib/passenger"

RSpec.describe Passenger do
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  describe "#initialize" do
    it "can initialize a passenger with attributes" do
      expect(@charlie).to be_a(Passenger)
      expect(@charlie.name).to eq("Charlie")
      expect(@charlie.age).to eq(18)
      expect(@charlie.driver?).to eq(false)
    end

    it "can initialize a different passenger with attributes" do
      expect(@taylor).to be_a(Passenger)
      expect(@taylor.name).to eq("Taylor")
      expect(@taylor.age).to eq(12)
      expect(@taylor.driver?).to eq(false)
    end
  end

  describe "#adult?" do
    it "can determine if passenger is 18 or over" do
      expect(@charlie.adult?).to eq(true)
      expect(@taylor.adult?).to eq(false)
    end
  end

  describe "#driver?" do
    it "can determine if passenger is the driver" do
      expect(@charlie.driver?).to eq(false)
      expect(@taylor.driver?).to eq(false)
    end
  end

  describe "#drive" do
    it "can make the passenger the driver" do
      expect(@charlie.driver?).to eq(false)
      @charlie.drive
      expect(@charlie.driver?).to eq(true)
    end

    it "will only make the passenger the driver if adult" do
      expect(@taylor.driver?).to eq(false)
      @taylor.drive
      expect(@taylor.driver?).to eq(false)
    end
  end
end
