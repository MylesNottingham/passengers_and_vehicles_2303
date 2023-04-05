class Park
  attr_reader :name,
              :admission_price,
              :vehicles

  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
    @passengers = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def passengers
    @passengers = @vehicles.map(&:passengers).flatten
  end

  def revenue
    @vehicles.sum(&:num_adults) * @admission_price
  end
end
