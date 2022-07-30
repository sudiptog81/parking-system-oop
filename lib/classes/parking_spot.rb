# frozen_string_literal: true

# Parking Spot on a Floor
class ParkingSpot
  attr_reader :vehicle, :free, :id

  def initialize(id)
    @id = id
    @free = true
    @vehicle = nil
  end

  # logic for parking
  def park(vehicle)
    @vehicle = vehicle
    @free = false
  end

  # logic for leaving
  def leave
    @vehicle = nil
    @free = true
  end
end
