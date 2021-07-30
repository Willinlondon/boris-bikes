DEFAULT_CAPACITY = 20

class DockingStation
  attr_accessor :bikes, :capacity
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
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
    @bikes.count >= @capacity
  end
end

