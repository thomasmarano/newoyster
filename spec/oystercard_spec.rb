require 'oystercard'
# require 'station'

describe Oystercard do

  let(:station){ double :station }

  before(:each) do
    @card = Oystercard.new
    @card.topup(20)
    @amount = double("amount")
    @exit_station = double("exit station")
  end

  it "has a balance" do
    expect(subject).to respond_to(:balance)
  end

  it "has initial balance of 0" do
    expect(subject.balance).to eq(0)
  end

  describe "#topup" do
    it "can be topped up" do
      expect(subject.topup(10)).to eq(10)
    end

    it "can raise error max amount exceeded" do
      max_topup = Oystercard::MAX_BALANCE
      subject.topup(max_topup)
      expect { subject.topup 1 }.to raise_error "max amount reached"
    end
  end

  describe "#journey?" do

    it 'is initially not in a journey' do
      expect(subject).not_to be_travelling
    end

    it "can touch in" do
      subject.topup(Oystercard::MIN_BALANCE)
      subject.touch_in(station)
      expect(subject).to be_travelling
    end

    it "can touch out" do
      subject.topup(Oystercard::MIN_BALANCE)
      subject.touch_in(station)
      subject.touch_out(@exit_station)
      expect(subject).not_to be_travelling
    end

  end

  describe "#touch_in" do

    it "checks balance is above min amount" do
      expect { subject.touch_in(station) }.to raise_error "balance too low"
    end

    it "can remember the last station" do
      subject.topup(Oystercard::MIN_BALANCE)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe "#touch_out" do
    it {is_expected.to respond_to(:touch_out).with(1).arguments}
    it "reduces balance by correct amount" do
        expect {subject.touch_out(@exit_station)}.to change{subject.balance}.by(-Oystercard::MIN_BALANCE)
    end

    it "forgets the last station" do
      subject.topup(Oystercard::MIN_BALANCE)
      subject.touch_in(station)
      subject.touch_out(@exit_station)
      expect(subject.entry_station).to eq nil
    end

    it "adds a journey to list_of_journies" do
        expect{@card.touch_out(@exit_station)}.to change{@card.list_of_journies.length}.by(1)
    end

  end

  describe

  describe "#list_of_journies" do
      it {is_expected.to respond_to(:list_of_journies)}

      it "is empty on instantiation of Oyster Card" do
          expect(subject.list_of_journies).to eq []
      end
  end

end
