require 'station'
require 'oystercard'

describe Station do
  before(:each) do
    @hammersmith = Station.new(double("zone"),double("name"))
  end
  it "Responds to #zone" do
    expect(@hammersmith).to respond_to(:zone)
  end
  it "Responds to #name" do
    expect(@hammersmith).to respond_to(:name)
  end

end
