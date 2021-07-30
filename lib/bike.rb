class Bike
  def initialize(number = 99)
    @number = number
  end
  def working?
    if @condition == "broken"
      false
    else true
    end
  end
end