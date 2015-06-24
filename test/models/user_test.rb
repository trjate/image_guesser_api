require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without an email" do
    user = User.new
    assert_not user.save, "Saved the user without an email"
  end

  test "users should have valid email" do
    user = User.new(email: "heytodo", username: "htphan", full_name: "Henry Phan", password: "papi")
    refute user.save, "Need a valid email to save"
  end

  test "users should be unique" do
    user_1 = users(:one)
    user_2 = users(:two)
    assert_not_equal(user_1, user_2)
  end
end
