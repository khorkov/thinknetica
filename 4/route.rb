=begin
Имеет начальную и конечную станцию, а также список промежуточных станций.
Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
Может добавлять промежуточную станцию в список
Может удалять промежуточную станцию из списка
Может выводить список всех станций по-порядку от начальной до конечной
=end

class Route

  attr_reader :stations

  def initialize(from, to)
    @stations = [from, to]
    puts "Маршрут построен: со старнции '#{@stations.first.name}' до станции '#{@stations.last.name}'"
  end

  def add_station(station)
    @stations.insert(-2, station)
    puts "Станция #{station.name} добавлена в маршрут"
  end

  def remove_station(station)
    if @stations.include?(station)
      @stations.delete(station)
      puts "Станция #{station.name} удалена из маршрута"
    else
      puts "Станция не найдена в маршруте"
    end
  end

  def list_station
    puts "Текущий маршрут:"
    @stations.each { |station| puts "#{station.name}" }
  end

end
