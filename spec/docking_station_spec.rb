require 'docking_station.rb'

describe DockingStation do
  before do 
    @docking_station = DockingStation.new
    @bike1 = double(:bike1, :working? => true)
    @bike2 = double(:bike2)
  end

  it 'raises an error if no bikes are available' do
    expect { @docking_station.release_bike }.to raise_error "No bikes available"
  end
  
    it 'checks a released bike is working' do
    @docking_station.dock(@bike1)
    @docking_station.dock(@bike2, "broken")
    expect(@docking_station.release_bike).to eq @bike1
  end
  
  it 'checks docking station is functional' do
    expect(@docking_station).to respond_to(:release_bike)
    expect(@bike1.working?).to eq true
    expect(@docking_station).to respond_to(:dock)
  end

  it 'checking docking station capacity' do
    @docking_station.capacity.times { @docking_station.dock(@bike1) }
    expect { @docking_station.dock(@bike2) }.to raise_error "Docking station is full"
  end
  
  it 'checks docking a bike works' do
    @docking_station.dock(@bike1)
    expect(@docking_station).to have_attributes(:bikes => [@bike1])
  end

  it "you can return bikes as broken" do
    expect(@docking_station.dock(@bike1, "broken").last).to eq(@docking_station.broken_bikes.last)
  end


end