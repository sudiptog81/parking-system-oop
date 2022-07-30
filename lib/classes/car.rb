# frozen_string_literal: true

class Car < Vehicle
  attr_reader :reg_no, :pricing_factor

  def initialize(reg_no)
    super reg_no
    @pricing_factor = 20
  end
end
