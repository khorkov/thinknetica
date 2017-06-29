class CargoWagon < Wagon

  attr_reader :volume, :busy_volume

  def initialize(volume)
    @type = :cargo
    @volume = volume
    @busy_volume = 0
  end

  def take_volume(volume)
    @busy_volume += volume unless free_volume < volume
  end

  def free_volume
    @volume - @busy_volume
  end

end
