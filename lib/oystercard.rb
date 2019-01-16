require 'journey'

class Oystercard

  attr_reader :balance, :entry_station, :list_of_journies, :journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station
    @list_of_journies = []
    @journey = Journey.new
  end

  def topup(amount)
    fail "max amount reached" if @balance + amount > MAX_BALANCE
    add(amount)
  end

  def add(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -=amount
  end

  def touch_in(station)
    fail "balance too low" if @balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    save_journey(@entry_station, station)
    @entry_station = nil
  end

  def travelling?
      @entry_station ? true : false
  end

  def save_journey(station1, station2)
      @list_of_journies << {entry: station1, exit: station2}
  end

private :add, :deduct, :save_journey

end
