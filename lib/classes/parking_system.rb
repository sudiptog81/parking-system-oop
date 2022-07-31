# frozen_string_literal: true

# Parking Lot Management System
class ParkingSystem
  private

  # issues a parking ticket for a vehicle that is exiting
  def issue_ticket(vehicle, exit_time)
    entry = @entries[vehicle.reg_no]
    @entries.delete vehicle.reg_no
    ParkingTicket.new vehicle, entry, exit_time
  end

  # checks if the vehicle has any unpaid tickets
  def due_tickets(vehicle)
    @tickets.select { |ticket| ticket.vehicle == vehicle and !ticket.is_paid }
  end

  public

  def initialize(lot = ParkingLot.new(2, 2))
    @lot = lot
    @tickets = []
    @entries = {}
  end

  # returns number of total spots in the lot
  def total_spots
    @lot.size
  end

  # returns a hashmap of free spots in the lot by floor
  def free_spots
    @lot.free_spots
  end

  # returns number of free spots in the lot
  def count_free_spots
    @lot.free_spots.sum { |_, v| v.length }
  end

  # returns number of free spots in the lot by floor
  def count_free_spots_by_floor
    @lot.free_spots.map(&:length)
  end

  # returns number of free spots in the lot on a particular floor
  def free_spots_by_floor_id(id)
    raise ParkingSystemErrors::FloorDoesNotExistError if @lot.floors[id].nil?

    @lot.free_spots[id]
  end

  # returns the parking spot corresponding to a particular id
  def spot_by_id(id)
    floor = id.split(/-/, 2)[0]
    @lot.floors[floor].spots[id] || nil
  end

  # returns the parking spot corresponding to a parked vehicle
  def spot_by_vehicle(vehicle)
    @lot.vehicles[vehicle] || nil
  end

  # returns the floor corresponding to a particular id
  def floor_by_vehicle(vehicle)
    @lot.vehicles[vehicle].split(/-/, 2)[0] || nil
  end

  # updates records and allows vehicle entry into the lot
  def park(vehicle)
    dues = due_tickets vehicle

    raise ParkingSystemErrors::ParkingTicketDueError unless dues.empty?

    @lot.park vehicle
    @entries[vehicle.reg_no] = Time.now
  end

  # updates records and allows vehicle exit from the lot
  def leave(vehicle, exit_time = Time.now)
    @tickets.append issue_ticket vehicle, exit_time
    @lot.leave vehicle.reg_no
  end

  # returns the ticket objects issued over time
  def tickets_issued
    @tickets
  end

  # accepts payment and marks the oldest ticket for a vehicle as paid
  def accept_payment(vehicle, type)
    dues = due_tickets vehicle

    raise ParkingSystemErrors::ParkingTicketNoDueError if dues.empty?

    dues[0].pay_ticket type
  end
end
