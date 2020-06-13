require_relative 'user'

class Dealer < User
  DEALER_STOP = 17

  def initialize(name='dealer')
    super
  end
end
