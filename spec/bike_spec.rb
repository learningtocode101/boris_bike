require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it "allows a bike to be reported broken" do
    expect(subject). to be_broken

  end
end
