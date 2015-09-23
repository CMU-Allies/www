require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get indxe" do
    get :indxe
    assert_response :success
  end

end
