class ParkingLot
  def initialize
    super
    @floors = Hash.new
    @parked = Hash.new

    (1 .. 2).each { |i|
      (1 .. 2).each { |j|
        @floors["#{i}-#{j}"] = Spot.new "#{i}-#{j}"
      }
    }
  end

  def print
    puts @floors, @parked
  end

  def get_spot_by_vehicle(vehicle)
    @floors[@parked[vehicle.reg_no]]
  end

  def get_vehicle_by_spot(spot)
    @floors[spot]
  end

  def park(vehicle)
    (@floors).each { |k, v|
      if v.vehicle.nil?
        vehicle.park @floors[k] unless vehicle.nil?
        @parked[vehicle.reg_no] = k unless vehicle.nil?
        return
      end
    }
  end

  def leave(vehicle)
    (@parked).each do |k, v|
      if k == vehicle&.reg_no
        @floors[v].vehicle.leave
        @parked.delete k
        return
      end
    end
  end
end
