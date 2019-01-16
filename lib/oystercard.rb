class Oystercard

  attr_reader :balance, :entry_station, :list_of_journies

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station
    @list_of_journies = []
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

  def travelling?
      @entry_station ? true : false
  end

  def touch_in(station)
    fail "balance too low" if @balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_BALANCE)
    @entry_station = nil
  end


private :add, :deduct

end
