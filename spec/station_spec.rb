require 'station'
require 'oystercard'

describe Station do
  subject {described_class.new(3,"hi")}
  it {is_expected.to respond_to(:name)}
  it {is_expected.to respond_to(:zone)}
end
