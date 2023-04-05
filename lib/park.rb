class Park
  attr_reader :name,
              :admission_price,
              :vehicles

  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
    @passenger_array = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def passengers
    @passenger_array = @vehicles.map(&:passengers).flatten
  end

  def revenue
    @vehicles.sum(&:num_adults) * @admission_price
  end

  def all_attendees
    passengers.map(&:name).flatten.sort
  end
end
