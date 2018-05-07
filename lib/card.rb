class Card
  attr_reader :value,
              :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def correct_card
    "#{@value} of #{@suit}"
  end

end
