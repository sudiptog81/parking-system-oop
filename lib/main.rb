# frozen_string_literal: true

require_relative 'imports'

begin
  one_hour = (1 * 60 * 60)

  ps = ParkingSystem.new ParkingLot.new 2, 2

  puts 'Initialized Parking System...'
  puts "Available Spots: (#{ps.count_free_spots}) #{ps.count_free_spots_by_floor.inspect}"

  v = Car.new 'DL3C1234'
  ps.park v
  puts "#{v.reg_no} parked at #{ps.spot_by_vehicle v.reg_no}..."

  sleep 5

  v2 = Bike.new 'KL4E3243'
  ps.park v2
  puts "#{v2.reg_no} parked at #{ps.spot_by_vehicle v2.reg_no}..."
  puts "ParkingSpot where #{v2.reg_no} is parked #{(ps.spot_by_id ps.spot_by_vehicle v2.reg_no).inspect}"

  sleep 2

  v3 = Vehicle.new 'DL1D1234'
  ps.park v3
  puts "#{v3.reg_no} parked at #{ps.spot_by_vehicle v3.reg_no}..."

  ps.leave v, Time.now + one_hour
  puts "#{v.reg_no} left..."

  puts "Free Spots: (#{ps.count_free_spots}) #{ps.free_spots.inspect}"

  ps.leave v2, Time.now + 2 * one_hour
  puts "#{v2.reg_no} left..."

  sleep 2

  ps.leave v3, Time.now + one_hour
  puts "#{v3.reg_no} left..."

  ps.accept_payment v, PaymentTypes::CASH
  puts "#{v.reg_no} paid ticket..."

  ps.park v
  puts "#{v.reg_no} parked at #{ps.spot_by_vehicle v.reg_no}..."

  ps.leave v, Time.now + 4 * one_hour
  puts "#{v.reg_no} left..."

  ps.accept_payment v, PaymentTypes::UPI
  puts "#{v.reg_no} paid ticket..."

  puts 'Tickets Issued:', ps.tickets_issued.inspect
rescue StandardError => e
  puts "Encountered #{e.class}..."
else
  puts 'Encountered an unhandled exception...'
end
