# frozen_string_literal: true

# Floor in a Parking Lot Building
class Floor
  attr_reader :free_spots, :occ_spots, :spots, :vehicles

  def initialize(level, spots)
    @free_spots = []
    @occ_spots = []
    @vehicles = {}
    @spots = {}
    # initialise all spots on a floor
    (1 .. spots).each do |i|
      @spots["#{level}-#{i}"] = ParkingSpot.new "#{level}-#{i}"
      @free_spots.append("#{level}-#{i}")
    end
  end

  # park a vehicle in a spot and update records
  def park(vehicle, spot)
    @spots[spot].park vehicle
    @vehicles[vehicle.reg_no] = spot
    @free_spots.delete spot
    @occ_spots << spot
  end

  # allow a vehicle to leave a spot and update records
  def leave(vehicle)
    @spots[@vehicles[vehicle]].leave
    @occ_spots.delete @vehicles[vehicle]
    @free_spots << @vehicles[vehicle]
    @vehicles.delete vehicle
    @free_spots.sort!
  end
end
