require 'journey'

class Oystercard

  attr_reader :balance, :journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
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
    @journey.entry_station = station
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    @journey.save_journey(@journey.entry_station, station)
    @journey.entry_station = nil
  end

private :add, :deduct

end
