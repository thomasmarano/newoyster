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
    raise "balance too low" if @balance < MIN_BALANCE
    begin
        @journey.start_journey(station)
    rescue
        deduct(6)
    end
  end

  def touch_out(station)
    begin
        @journey.end_journey(station)
        deduct(@journey.fare)
    rescue
        deduct(6)
    end
  end

private :add, :deduct

end
