# frozen_string_literal: true

# Parking Ticket
class ParkingTicket
  attr_reader :vehicle, :duration, :total, :is_paid, :payment_type

  def initialize(vehicle, entry_time, exit_time = Time.now)
    raise ParkingSystemErrors::ExitEarlierThanEntryError if exit_time < entry_time

    @vehicle = vehicle
    @duration = (exit_time - entry_time) / 60 / 60 # calculate number of hours spent
    @total = (@duration * vehicle.pricing_factor).round(2) # calculate total charge
    @total = (@total - 0.10 * @total).round(2) if vehicle.instance_of?(Bike) # apply any discounts
    @is_paid = false
    @payment_type = nil
  end

  def pay_ticket(type)
    @is_paid = true
    @payment_type = type
  end
end
