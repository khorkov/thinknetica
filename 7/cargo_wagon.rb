class CargoWagon < Wagon

  def initialize(volume)
    @type = :cargo
    @volume = volume
    @current_volume = 0
  end

  def take_volume(volume)
    @current_volume += volume unless free_volume < volume
  end

  def busy_volume
    @current_volume
  end

  def free_volume
    @volume - @current_volume
  end

end
