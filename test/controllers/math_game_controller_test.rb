require "test_helper"

class MathGameControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get math_game_new_url
    assert_response :success
  end
end
