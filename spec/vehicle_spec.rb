require "./lib/vehicle"
require "./lib/passenger"

RSpec.describe Vehicle do
  before(:each) do
    @vehicle = Vehicle.new("2001", "Honda", "Civic")
    @charlie = Passenger.new({ "name" => "Charlie", "age" => 18 })
    @jude = Passenger.new({ "name" => "Jude", "age" => 20 })
    @taylor = Passenger.new({ "name" => "Taylor", "age" => 12 })
  end

  describe "#initialize" do
    it "can initialize a vehicle with attributes" do
      expect(@vehicle).to be_a(Vehicle)
      expect(@vehicle.year).to eq("2001")
      expect(@vehicle.make).to eq("Honda")
      expect(@vehicle.model).to eq("Civic")
      expect(@vehicle.passengers).to eq([])
    end

    it "can initialize a different vehicle with attributes" do
      vehicle_2 = Vehicle.new("2010", "Toyota", "Tundra")
      expect(vehicle_2).to be_a(Vehicle)
      expect(vehicle_2.year).to eq("2010")
      expect(vehicle_2.make).to eq("Toyota")
      expect(vehicle_2.model).to eq("Tundra")
      expect(vehicle_2.passengers).to eq([])
    end
  end

  describe "#speeding?" do
    it "can determine if vehicle is speeding" do
      expect(@vehicle.speeding?).to eq(false)
    end
  end

  describe "#speed" do
    it "can make the vehicle speed" do
      expect(@vehicle.speeding?).to eq(false)
      @vehicle.speed
      expect(@vehicle.speeding?).to eq(true)
    end
  end

  describe "#add_passenger" do
    it "can add passengers to the vehicle" do
      expect(@vehicle.passengers).to eq([])
      @vehicle.add_passenger(@charlie)
      expect(@vehicle.passengers).to eq([@charlie])
      @vehicle.add_passenger(@jude)
      expect(@vehicle.passengers).to eq([@charlie, @jude])
      @vehicle.add_passenger(@taylor)
      expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
    end
  end

  describe "#num_adults" do
    it "can determine the number of adults in the vehicle" do
      expect(@vehicle.num_adults).to eq(0)
      @vehicle.add_passenger(@charlie)
      expect(@vehicle.num_adults).to eq(1)
      @vehicle.add_passenger(@jude)
      expect(@vehicle.num_adults).to eq(2)
      @vehicle.add_passenger(@taylor)
      expect(@vehicle.num_adults).to eq(2)
    end
  end
end
