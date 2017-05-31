=begin
Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов,
эти данные указываются при создании экземпляра класса
Может набирать скорость
Может возвращать текущую скорость
Может тормозить (сбрасывать скорость до нуля)
Может возвращать количество вагонов
Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов).
Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
Может принимать маршрут следования (объект класса Route). 
При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
=end

class Train

  attr_accessor :speed

  def initialize(number, type, wagon)
    @number = number
    @type = type
    @wagon = wagon
    @speed = speed

    puts "Собран новый поезд №#{@number}, типа #{@type}, с #{@wagon} вагоном(ми)"
  end

  def speed_up
    @speed += 20
    puts "Поезд №#{@number} ускорился на 20 км/ч, теперь его скорость составляет #{@speed}"
  end

  def current_speed
    puts "Текущая скорость #{@speed}"
  end

  def stop
    @speed = 0
    puts "Тормозим!"
  end

  def list
    puts "Количество вагонов: #{@wagon}"
  end

  def add_wagon
    if @speed.zero?
      @wagon += 1
      puts "Прицепляем вагон"
    else
      puts "Нельзя прицепить вагон на ходу!"
    end
  end

  def delete_wagon
    if @speed.zero?
      @wagon -= 1
        puts "Отцепляем вагон"
    else
      puts "Сначала нужно остановить поезд!"
    end
  end

  def take_route(route)
    @route = route
    @station = route.stations.first
    puts "Маршрут принят: #{route.station.first.name} - #{route.stations.last.name}"
  end

  def go_forward
    if current_station != next_station
      @station = next_station
      puts "Поехали на станцию #{@station.name}"
    else
      puts "Вы на конечной станции в маршруте"
    end
  end

  def go_back
    if current_station != previous_station
      @station = previous_station
      puts "Приехали на станцию: #{@station.name}"
    else
      puts "Вы на первой станции в маршруте"
    end
  end

  def previous_station
    previous_index = @route.stations.find_inex(@station) -1
    if previous_index = negative?
      @station
    else
      @route.stations[previous_index]
    end
  end

  def current_station
    next_index = @route.stations.find_index(@station) + 1
    if route.station.[next_index].nil?
      @station
    else
      @route.stations.[next_index]
    end
  end

 end
