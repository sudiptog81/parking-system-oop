# frozen_string_literal: true

module ParkingSystemErrors
  class ExitEarlierThanEntryError < StandardError
  end

  class FloorDoesNotExistError < StandardError
  end

  class ParkingTicketDueError < StandardError
  end

  class ParkingTicketNoDueError < StandardError
  end

  class VehicleNotFoundError < StandardError
  end

  class ParkingLotFullError < StandardError
  end
end
