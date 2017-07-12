class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  NUMBER_FORMAT = /^[a-z0-9]{3}-?[a-z0-9]{2}$/

  @@trains = {}

  attr_reader :number, :type, :wagons, :route

  validate :number, :presence
  validate :id, :format, NUMBER_FORMAT

  def initialize(number)
    @number = number
    validate!
    @wagons = []
    @speed = 0
    @@trains[number] = self
    register_instance
  end

  def speed(speed)
    @speed += speed
  end

  def self.find(number)
    @@trains[number]
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
      puts 'Вы на конечной станции в маршруте'
    end
  end

  def go_back
    if current_station != previous_station
      move_to_station(prev_station)
    else
      puts 'Вы на первой станции в маршруте'
    end
  end

  def previous_station
    previous_index = @route.stations.find_index(@station) - 1
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

  def valid?
    validate!
  rescue
    false
  end

  def with_each_wagons(&_block)
    @wagons.each_with_index { |wagon, index| yield(wagon, index) }
  end

  protected

  def move_to_station(station)
    @station.send_train(self)
    @station = station
    @station.take_train(self)
  end

  def wagon_valid?(wagon)
    raise 'Сначала остановите поезд' unless @speed.zero?
    raise 'Не подходящий тип вагона!' unless wagon.type.eql?(wagon.type)
    true
  end

  def validate!
    raise 'Неверный номер поезда. Введите еще раз.' if number !~ NUMBER_FORMAT
  end
end
