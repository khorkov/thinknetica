class CargoTrain < Train

  def initialize(number)
    super
    @type = :cargo
    register_instance
  end

end
