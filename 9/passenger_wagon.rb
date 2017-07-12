class PassengerWagon < Wagon
  attr_reader :seats, :passengers

  def initialize(seats)
    @seats = seats
    @type = :passenger
    register_instance
    @passengers = 0
  end

  def take_seats
    @passengers += 1 unless free_seats.zero?
  end

  def free_seats
    @seats - @passengers
  end
end
