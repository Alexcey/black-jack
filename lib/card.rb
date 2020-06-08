class Card
  attr_reader :value, :name

  def initialize(value, name)
    @name = name
    @value = value
  end
end
