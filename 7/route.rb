class Route

  attr_accessor :stations

  def initialize(from, to)
    @stations = [from, to]
    validate!
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

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Название станции не может быть пустым" if @stations.empty?
    raise "Станций должно быть больше двух" if @stations.size < 2
    true
  end

end
