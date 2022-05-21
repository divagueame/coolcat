require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:kitty)
  end


  test "should get home" do
    get pages_home_url
    assert_response :success
  end
  
  test "Logged out users don't show username" do
    sign_out users(:kitty)
    get pages_home_url
    assert_response :success
    assert_select '#user_email', 0
    
  end
  
end
