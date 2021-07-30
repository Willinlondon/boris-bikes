class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end
  
  def release_bike
    raise "No bikes available" if empty?
    bike = @bikes.pop
  end
  
  def dock(bike)
    raise "Docking station is full" if full?
    @bikes << bike
  end
  
  private
  
  def empty?
    @bikes.count == 0
  end
  
  def full?
    @bikes.count >= 20
  end
end

