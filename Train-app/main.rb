FREIGHT = 'freight'.freeze
PASSENGER = 'passenger'.freeze

require_relative './railway_station'
require_relative './route'
require_relative './train'

# freight_train = Train.new('4242', FREIGHT, 0)
# passenger_train = Train.new('4343', PASSENGER, 0)

nagoya = RailwayStation.new('Nagoya')
tsushima = RailwayStation.new('Tsushima')
okazaki = RailwayStation.new('Okazaki')
seto = RailwayStation.new('Seto')

tokyo_route = Route.new(nagoya, tsushima)

a = RailwayStation.new("A")
b = RailwayStation.new("B")
c = RailwayStation.new("C")
d = RailwayStation.new("D")

r = Route.new(nagoya, seto)
r.add(tsushima)
r.add(okazaki)

T = Train.new(123, "FAST", 0)
T.take_route(r)
# puts T.station
# puts T.station_index
# puts T.next_station
# puts T.station.name
# T.move_backward
# puts T.station.name

# T.move_forward
# puts T.station.name
# T.move_forward
# puts T.station.name
# T.move_backward
# puts T.station.name
# T.move_forward
# puts T.station.name