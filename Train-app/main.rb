FREIGHT = 'freight'.freeze
PASSENGER = 'passenger'.freeze

require_relative './railway_station'
require_relative './route'
require_relative './train'

freight_train = Train.new('4242', FREIGHT, 0)
passenger_train = Train.new('4343', PASSENGER, 0)

nagoya = RailwayStation.new('Nagoya')
tsushima = RailwayStation.new('Tsushima')
okazaki = RailwayStation.new('Okazaki')
seto = RailwayStation.new('Seto')

tokyo_route = Route.new(nagoya, tsushima)
