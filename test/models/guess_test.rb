require 'test_helper'

class GuessTest < ActiveSupport::TestCase
  test "guess associated with post?" do
    guess1 = guesses(:oneguess)
    assert_equal guess1.post, posts(:onepost) 
  end

  test "actual guess required to save" do
    guess2 = Guess.new
    refute guess2.save
  end

  test "guess associated with user?" do
    guess3 = guesses(:twoguess)
    assert_equal guess3.user, users(:twoperson)
  end

end

