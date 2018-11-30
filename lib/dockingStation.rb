require_relative 'bike.rb'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bike
  def initialize
    @bike_collection = []
  end

  def release_bike
    fail "No Bikes Available" if empty?
    @bike_collection.pop
  end

  def dock(bike)
    fail "No Space Available" if full?
    @bike_collection << bike
  end

private

  def full?
    @bike_collection.count == DEFAULT_CAPACITY
  end

  def empty?
    @bike_collection.empty?
  end
end
