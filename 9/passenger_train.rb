class PassengerTrain < Train
  def initialize(number)
    super
    @type = :passenger
    register_instance
  end
end
