# frozen_string_literal: true

# Parking Lot Building
class ParkingLot
  attr_reader :size, :floors, :vehicles

  def initialize(floors, spots_per_floor)
    @size = floors * spots_per_floor
    @floors = {}
    @vehicles = {}
    (1 .. floors).each do |i|
      @floors[i.to_s] = Floor.new i, spots_per_floor
    end
  end

  def free_spots
    result = {}
    @floors.filter { |_, v| !v.free_spots.empty? }.each { |k, v| result[k] = v.free_spots }
    result
  end

  def free_spots_by_floor(floor)
    @floors[floor].free_spots
  end

  def park(vehicle)
    @floors.each do |_, v|
      next if v.free_spots.empty?

      @vehicles[vehicle.reg_no] = v.free_spots[0]
      v.park vehicle, v.free_spots[0]
      break
    end
  end

  def leave(vehicle)
    @floors.each do |_, v|
      next unless v.vehicles.include? vehicle

      @vehicles.delete vehicle
      v.leave vehicle
      break
    end
  end
end
