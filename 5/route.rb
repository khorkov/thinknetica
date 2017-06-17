class Route

  attr_reader :stations

  def initialize(from, to)
    @stations = [from, to]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    if @stations.include?(station)
      @stations.delete(station)
    else
      puts "Станция не найдена в маршруте"
    end
  end

  def list_station
     @stations.each_with_index { |station, index| puts "#{index} #{station.name}"  }
  end

end
