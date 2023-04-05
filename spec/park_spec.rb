require "./lib/park"
require "./lib/vehicle"
require "./lib/passenger"

RSpec.describe Park do
  before(:each) do
    @yosemite = Park.new("Yosemite", 20)
    @mesa_verde = Park.new("Mesa Verde", 15)

    @civic = Vehicle.new("2001", "Honda", "Civic")
    @tundra = Vehicle.new("2010", "Toyota", "Tundra")

    @charlie = Passenger.new({ "name" => "Charlie", "age" => 18 })
    @jude = Passenger.new({ "name" => "Jude", "age" => 20 })
    @taylor = Passenger.new({ "name" => "Taylor", "age" => 12 })
  end

  describe "#initialize" do
    it "can initialize a park with attributes" do
      expect(@yosemite).to be_a(Park)
      expect(@yosemite.name).to eq("Yosemite")
      expect(@yosemite.admission_price).to eq(20)
      expect(@yosemite.vehicles).to eq([])
    end

    it "can initialize a different park with attributes" do
      expect(@mesa_verde).to be_a(Park)
      expect(@mesa_verde.name).to eq("Mesa Verde")
      expect(@mesa_verde.admission_price).to eq(15)
      expect(@mesa_verde.vehicles).to eq([])
    end
  end

  describe "#add_vehicle" do
    it "can add vehicles to a park" do
      expect(@yosemite.vehicles).to eq([])
      @yosemite.add_vehicle(@civic)
      expect(@yosemite.vehicles).to eq([@civic])
      @yosemite.add_vehicle(@tundra)
      expect(@yosemite.vehicles).to eq([@civic, @tundra])
    end

    it "can add vehicles to another park" do
      expect(@mesa_verde.vehicles).to eq([])
      @mesa_verde.add_vehicle(@civic)
      expect(@mesa_verde.vehicles).to eq([@civic])
      @mesa_verde.add_vehicle(@tundra)
      expect(@mesa_verde.vehicles).to eq([@civic, @tundra])
    end
  end

  describe "#passengers" do
    it "can return an array of all passengers in a park" do
      @yosemite.add_vehicle(@civic)
      expect(@yosemite.passengers).to eq([])

      @civic.add_passenger(@charlie)
      @civic.add_passenger(@taylor)
      expect(@yosemite.passengers).to eq([@charlie, @taylor])

      @yosemite.add_vehicle(@tundra)
      @tundra.add_passenger(@jude)
      expect(@yosemite.passengers).to eq([@charlie, @taylor, @jude])
    end

    it "can return an array of all passengers in another park" do
      @mesa_verde.add_vehicle(@civic)
      expect(@mesa_verde.passengers).to eq([])

      @civic.add_passenger(@charlie)
      @civic.add_passenger(@taylor)
      expect(@mesa_verde.passengers).to eq([@charlie, @taylor])

      @mesa_verde.add_vehicle(@tundra)
      @tundra.add_passenger(@jude)
      expect(@mesa_verde.passengers).to eq([@charlie, @taylor, @jude])
    end
  end

  describe "#revenue" do
    it "can determine the total admission costs collected for a park" do
      @yosemite.add_vehicle(@civic)
      @yosemite.add_vehicle(@tundra)

      expect(@yosemite.revenue).to eq(0)
      @civic.add_passenger(@charlie)
      expect(@yosemite.revenue).to eq(20)
      @civic.add_passenger(@taylor)
      expect(@yosemite.revenue).to eq(20)
      @tundra.add_passenger(@jude)
      expect(@yosemite.revenue).to eq(40)
    end

    it "can determine the total admission costs collected for another park" do
      @mesa_verde.add_vehicle(@civic)
      @mesa_verde.add_vehicle(@tundra)

      expect(@mesa_verde.revenue).to eq(0)
      @civic.add_passenger(@charlie)
      expect(@mesa_verde.revenue).to eq(15)
      @civic.add_passenger(@taylor)
      expect(@mesa_verde.revenue).to eq(15)
      @tundra.add_passenger(@jude)
      expect(@mesa_verde.revenue).to eq(30)
    end
  end
end
