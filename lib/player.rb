require_relative 'user'

class Player < User
  def initialize(name)
    @name = name
    super
  end
end
