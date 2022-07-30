# frozen_string_literal: true

# Base Class for Vehicles
class Vehicle
  attr_reader :reg_no, :pricing_factor

  def initialize(reg_no)
    @reg_no = reg_no
    @pricing_factor = 10
  end
end
