# Parking Lot Management System

Created during an OOP Coding Assignment for a Junior Developer role. Implemented in Ruby.

## Problem Statement

Using your preferred high level OO programming language, write a code to implement a Parking Management Software System
for a multi storey building, using the Object Oriented Model of programming.

- This Software is for a multi storey building. ✅
- This Software System should allow a visiting user to park his vehicle at the empty parking spot and leave it later on.
  ✅
- There should be a function to tell us count of total parking spots and count of available parking spots on all floors.
  ✅
- The System should be able to tell where a specific car is parked when searched by car’s number. ✅
- It should have a functionality to list all available empty parking spots on all floors of a parking building by floor
  number/name and by parking spot number/name. ✅

Not compulsory but Bonus Points if you code below functionality too:

- While leaving the premises, inform users about the parking charges which will be calculated as per how many hours the
  car was parked there. ✅

## Modelling Assumptions

- A vehicle cannot enter the parking lot unless all dues related to the vehicle are paid.
- A parking spot shall be identified as `<floor>-<spot_no>`.
- The parking spot closest to the entrance shall be allocated.
- Special vehicle types such as Bikes get a discount on the parking charges, while others have a higher premium.
- A vehicle cannot park in another parking spot before exiting the parking lot.
- A parking ticket can only be paid in full.

## Concepts Used

- Abstraction
- Encapsulation
- Inheritance
- Polymorphism using Inheritance

## Classes

- `ParkingSystem` - provides APIs to use the required features, base concept class that governs the functioning of a
  parking lot.
- `ParkingLot` - conceptual model of a multi storey parking lot building, consists of a number of floors and maintains a
  log of the floor a vehicle is parked on.
- `Floor` - conceptual model of a floor in a parking lot, maintains a record of free spots, occupied spots and a mapping
  of vehicles to their parking spots.
- `ParkingSpot` - model of a parking spot in which a vehicle can be parked and later be left from.
- `Vehicle` - model of a generic vehicle that will be using the parking lot, that has a registration number and a
  pricing/charging factor associated with it.
- `Bike`, `Car` - specific models of vehicles that may have different rules for billing.
- `ParkingTicket` - conceptual model of a parking ticket that contains the vehicle's registration number, the duration
  spent in the parking lot, total charges for the same and whether the ticket/bill has been paid or not, if yes, the
  payment method.

## Modules

- `PaymentTypes` - contains symbols for allowed payment types, (workaround for `enum` in Ruby).
- `ParkingSystemErrors` - various error classes for error/exception handling in code.

## Sample Output

```txt
Initialized Parking System...
Available Spots: (4) [2, 2]
DL3C1234 parked at 1-1...
KL4E3243 parked at 1-2...
ParkingSpot where KL4E3243 is parked #<ParkingSpot:0x0000027b4d255308 @id="1-2", @free=false, @vehicle=#<Bike:0x0000027b4d278a10 @reg_no="KL4E3243", @pricing_factor=10>>
DL1D1234 parked at 2-1...
DL3C1234 left...
Free Spots: (2) {"1"=>["1-1"], "2"=>["2-2"]}
KL4E3243 left...
DL1D1234 left...
DL3C1234 paid ticket...
DL3C1234 parked at 1-1...
DL3C1234 left...
DL3C1234 paid ticket...
Tickets Issued:
[#<ParkingTicket:0x0000027b4d27a1d0 @vehicle=#<Car:0x0000027b4d27a158 @reg_no="DL3C1234", @pricing_factor=20>, @duration=1.0019448560555555, @total=20.04, @is_paid=true, @payment_type=:cash>, #<ParkingTicket:0x0000027b4d263430 @vehicle=#<Bike:0x0000027b4d278a10 @reg_no="KL4E3243", @pricing_factor=10>, @duration=2.0005560695833333, @total=18.01, @is_paid=false, @payment_type=nil>, #<ParkingTicket:0x0000027b4d2631b0 @vehicle=#<Vehicle:0x0000027b4d278240 @reg_no="DL1D1234", @pricing_factor=10>, @duration=1.0005558522222222, @total=10.01, @is_paid=false, @payment_type=nil>, #<ParkingTicket:0x0000027b4d262d00 @vehicle=#<Car:0x0000027b4d27a158 @reg_no="DL3C1234", @pricing_factor=20>, @duration=4.000000045499999, @total=80.0, @is_paid=true, @payment_type=:upi>]
Encountered an unhandled exception...

```

## Author

[Sudipto Ghosh](mailto:sudipto@ghosh.pro)
