class Bike
  def initialize(number = 99, condition ="working")
    @number = number
    @condition = condition
  end
  def working?
    @condition == "working"
  end
end