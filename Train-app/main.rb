FREIGHT = 'freight'.freeze
PASSENGER = 'passenger'.freeze

require_relative './train'
require_relative './route'
require_relative './railway_station'

freight_train = Train.new('4242', FREIGHT)
passenger_train = Train.new('4343', PASSENGER)

puts 'brake'
freight_train.brake
freight_train.speed_up
freight_train.brake

puts 'add_carriage'
freight_train.add_carriage
freight_train.speed_up
freight_train.add_carriage
freight_train.brake

puts 'delete_carriage'
freight_train.speed_up
freight_train.delete_carriage
freight_train.brake
freight_train.delete_carriage

puts 'take_route near_stations move'
freight_train.near_stations
freight_train.take_route(%w[Nagoya Toyohashi Okazaki Seto Toyokawa Tsushima])
freight_train.near_stations
freight_train.move('Toyohashi')
freight_train.near_stations

Nagoya = RailwayStation.new('Nagoya')
puts 'take_train'
Nagoya.take_train(freight_train.hash)
Nagoya.take_train(passenger_train.hash)
Nagoya.take_train({})
Nagoya.trains_list
Nagoya.trains_list_by_type

puts 'send_train'
Nagoya.send_train(freight_train.hash)
Nagoya.trains_list
Nagoya.trains_list_by_type
Nagoya.send_train({})
Nagoya.trains_list
Nagoya.trains_list_by_type
