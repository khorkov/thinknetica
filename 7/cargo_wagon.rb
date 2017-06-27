class CargoWagon < Wagon

  attr_reader :volume

  def initialize(volume)
    @type = :cargo
    @volume = volume
    @current_volume = 0
  end

  def take_volume(current_volume)
    @current_volume += 1
  end

  def busy_volume
    @current_volume
  end

  def free_volume
    @volume - @current_volume
  end

end
