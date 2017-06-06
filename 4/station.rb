=begin
Имеет название, которое указывается при ее создании
Может принимать поезда (по одному за раз)
Может возвращать список всех поездов на станции, находящиеся в текущий момент
Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
=end

class Station

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
    puts "Создана станция #{name}"
  end

  def take_train(train)
    train.stop
    @trains << train
    puts "Прибыл #{train.type} поезд №#{train.number} #{train.route.stations.first.name} - #{train.route.stations.last.name} с #{train.wagon} вагоном(ми)"
  end

  def list
    @trains.each do |train|
      puts "#{train.number} #{train.route.stations.first.name} - #{train.route.stations.last.name}"
    end
  end

  def list_type(type)
    @trains.select { |train| train.type == type }.each do |train|
      puts "#{train.number} #{train.route.stations.first.name} - #{train.route.station.last.name}"
    end
  end

  def send_train(train)
    if @trains.include?(train)
      @trains.delete(train)
      puts "#{train.type.capitalize} поезд №#{train.number} #{train.route.stations.first.name} - #{train.route.stations.last.name} отправляется"
    else
      puts "Такого поезда нет на станции"
    end
  end

end
