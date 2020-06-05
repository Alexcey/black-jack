class User
  BANK = 100
  RATE = 10

  attr_reader :name, :balance

  def initialize(name)
    @name = name
    @balance = BANK
    @card = []
  end

  def can_play?
    @balance >= RATE
  end

  def loss_bank
    @balance -= RATE
  end

  def win_bank
    @balance += RATE*2
  end

  def clear
    @card.clear
  end
end
