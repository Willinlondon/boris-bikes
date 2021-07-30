DEFAULT_CAPACITY = 20

class DockingStation
  attr_accessor :bikes, :capacity, :broken_bikes
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end
  
  def release_bike
    raise "No bikes available" if empty?
    @bikes.pop
  end
  
  def dock(bike, condition = "working")
    raise "Docking station is full" if full?
    
    if condition == "broken"
      @broken_bikes << bike
    else
    @bikes << bike
    end
  end
  
  private
  
  def empty?
    @bikes.count == 0
  end
  
  def full?
    @bikes.count + @broken_bikes.count >= @capacity
  end
end