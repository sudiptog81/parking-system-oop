class ParkingSystem
  def initialize
    super
    puts "Init Parking System"
    @lot = ParkingLot.new
  end

  def park(vehicle)
    @lot.park vehicle
    @lot.print
  end

  def leave(vehicle)
    @lot.leave vehicle
    @lot.print
  end
end
