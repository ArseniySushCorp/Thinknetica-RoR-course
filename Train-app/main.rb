FREIGHT = 'freight'.freeze
PASSENGER = 'passenger'.freeze

require_relative './railway_station'
require_relative './route'
require_relative './train'

freight_train = Train.new('4242', FREIGHT, 0)
passenger_train = Train.new('4343', PASSENGER, 0)

puts
puts 'brake'
freight_train.brake
freight_train.speed_up
freight_train.brake

puts
puts 'add_carriage'
freight_train.add_carriage
freight_train.speed_up
freight_train.add_carriage
freight_train.brake

puts
puts 'delete_carriage'
freight_train.speed_up
freight_train.delete_carriage
freight_train.brake
freight_train.delete_carriage

puts
puts 'take_route near_stations move'
freight_train.near_stations
freight_train.take_route(%w[Nagoya Toyohashi Okazaki Seto Toyokawa Tsushima])
freight_train.near_stations
freight_train.move('Toyohashi')
freight_train.near_stations

puts
puts 'RailwayStation.new'
Nagoya = RailwayStation.new('Nagoya')
Tsushima = RailwayStation.new('Tsushima')
Okazaki = RailwayStation.new('Okazaki')
Seto = RailwayStation.new('Seto')

puts
puts 'take_train'
Nagoya.take_train(freight_train.hash)
Nagoya.take_train(passenger_train.hash)
Nagoya.take_train({})
Nagoya.trains_list
Nagoya.trains_list_by_type

puts
puts 'send_train'
Nagoya.send_train(freight_train.hash)
Nagoya.trains_list
Nagoya.trains_list_by_type
Nagoya.send_train({})
Nagoya.trains_list
Nagoya.trains_list_by_type

puts
puts 'Route.new'
tokyo_route = Route.new(Nagoya, Tsushima)
tokyo_route.first
tokyo_route.last
tokyo_route.show_all

puts
puts 'add_station'
tokyo_route.add(Okazaki)
tokyo_route.show_all
tokyo_route.add('4242')
tokyo_route.show_all

puts
puts 'delete_station'
tokyo_route.delete(Okazaki)
tokyo_route.show_all
tokyo_route.delete('4242')
tokyo_route.show_all

puts
puts 'Train take route instance_of? Route'
tokyo_route.add(Okazaki)
tokyo_route.add(Seto)
tokyo_route.show_all
passenger_train.take_route(tokyo_route)
puts passenger_train.route
