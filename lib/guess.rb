class Guess
  attr_reader :card,
              :response

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    response == card.correct_card
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect"
    end
  end



end
