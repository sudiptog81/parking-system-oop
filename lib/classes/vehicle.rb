class Vehicle
  attr_accessor :reg_no, :spot

  def initialize(reg_no)
    @reg_no = reg_no
    @price_factor = 1.0
    @spot = nil
    @entry = nil
  end

  def park(spot)
    @spot = spot
    @spot.park self unless @spot.nil?
    @entry = Time.now
    puts @reg_no, "Entered #{spot.id} at #{@entry}"
  end

  def leave
    unless @entry.nil?
      now = Time.now
      diff = now - @entry
      @spot.free unless @spot.nil?
      @spot = nil
      puts "Exited at #{now}"
      puts "Total Parking Charges: ₹ #{(diff * @price_factor).round(2)}"
    end
  end

end
