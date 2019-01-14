class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @travelling = false
    # @journey = false
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
    @travelling
  end

  def touch_in
    @travelling = true
  end

  def touch_out
    @travelling = false
  end

  # def in_journey?
  #   @journey
  # end
  #
  # def touch_in
  #   @journey = true
  # end
  #
  # def touch_out
  #   @journey = false
  # end

private :add

end
