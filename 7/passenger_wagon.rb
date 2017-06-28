class PassengerWagon < Wagon

  attr_reader :seats

  def initialize(seats)
    @seats = seats
    @type = :passenger
    register_instance
    @passengers = 0
  end

  def take_seats
    @passengers += 1 unless free_seats.zero?
  end

  def busy_seats
    @passengers
  end

  def free_seats
    @seats - @passengers
  end

end
