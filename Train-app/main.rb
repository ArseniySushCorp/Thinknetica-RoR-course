require_relative './railway_station'
require_relative './route'

require_relative './carriages/carriage'
require_relative './carriages/cargo_carriage'
require_relative './carriages/passenger_carriage'

require_relative './trains/train'
require_relative './trains/cargo_train'
require_relative './trains/passenger_train'

Nagoya = RailwayStation.new('Nagoya')
Tsushima = RailwayStation.new('Tsushima')
Okazaki = RailwayStation.new('Okazaki')
Seto = RailwayStation.new('Seto')

tokyo_route = Route.new(Nagoya, Tsushima)

cargo_train = CargoTrain.new('4242')
passenger_train = PassengerTrain.new('4343')

cargo_carriage = CargoCarriage.new('1212')
passenger_carriage = PassengerCarriage.new('1313')

cargo_train.add_carriage(passenger_carriage)
passenger_train.add_carriage(cargo_carriage)

cargo_train.add_carriage(cargo_carriage)
passenger_train.add_carriage(passenger_carriage)
