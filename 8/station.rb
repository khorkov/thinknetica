class Station
  @@stations = []

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
  end

  def self.all
    @@stations
  end

  def take_train(train)
    @trains << train
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
    @trains.delete(train) if @trains.include?(train)
  end

  def valid?
    validate!
  rescue
    false
  end

  def with_each_train(&_block)
    @trains.each { |train| yield(train) }
  end

  protected

  def validate!
    raise 'Название станции не может быть пустым!' if name.nil?
    raise 'Название станиции должно быть не менее 6 симовлов' if name.length < 6
    true
  end
end
