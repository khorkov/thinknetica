class Train

  attr_reader :number, :type, :wagons, :route

  def initialize(number)
    @number = number
    @wagons = []
  end

  def list
    @wagons.count
  end

  def attach_wagon(wagon)
    @wagons << wagon if wagon_valid?(wagon)
  end

  def unhook_wagon
    @wagons.pop if list.positive?
  end

  def take_route(route)
    @route = route
    @station = route.stations.first
    move_to_station(@station)
  end

  def go_forward
    if current_station != next_station
      move_to_station(next_station)
    else
      puts "Вы на конечной станции в маршруте"
    end
  end

  def go_back
    if current_station != previous_station
      move_to_station(prev_station)
    else
      puts "Вы на первой станции в маршруте"
    end
  end

  def previous_station
    previous_index = @route.stations.find_index(@station) -1
    if previous_index.negative?
      @station
    else
      @route.stations[previous_index]
    end
  end

  def current_station
    @station
  end

 def next_station
  next_index = @route.stations.find_index(@station) + 1
    if route.stations[next_index].nil?
      @station
      else
        @route.stations[next_index]
    end
 end

 protected

# Методы служат для внутреннего использования в классе

  def move_to_station(station)
    @station.send_train(self)
    @station = station
    @station.take_train(self)
  end

  def wagon_valid?(wagon)
    if !@speed.zero?
      puts "Сначала остановите поезд"
      false
    elsif !@type.eql?(wagon.type)
      puts "Не подходящий тип вагона!"
      false
    else
      true
    end
  end

end
