class Spot
  attr_accessor :vehicle, :free, :id

  def initialize(id)
    @id = id
    @free = true
    @vehicle = nil
  end

  def park(vehicle)
    @vehicle = vehicle
    @free = false
  end

  def free
    @vehicle = nil
    @free = true
  end
end
