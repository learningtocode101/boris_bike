
require 'dockingStation'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "gives us a working bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "docks a bike" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it "raises an error when release_bike and no bike available" do
    expect { subject.release_bike }.to raise_error("No Bikes Available")
  end

  it "raises an error when dock and capacity is full" do
    subject.capacity.times { subject.dock Bike.new }
    expect { subject.dock(Bike.new) }.to raise_error("No Space Available")
  end

  it "allows user to set max capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "raises no error when docked bike is broken or not" do
    allow(Bike.new).to receive(:broken?)
    expect { subject.dock(Bike.new) }.to_not raise_error
  end
end
