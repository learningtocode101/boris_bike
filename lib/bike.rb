class Bike

  def working?
    true
  end

  def report_broken
    @broken = true
  end

  def broken?
    report_broken
  end
end
