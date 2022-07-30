require_relative 'imports'

ps = ParkingSystem.new
v = Vehicle.new "DL3C1234"

ps.park v

sleep 5

v2 = Vehicle.new "KL4E3243"
ps.park v2

sleep 2

ps.leave v2
ps.leave v
