require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:kitty)
  end


  test "should get home" do
    get pages_home_url
    assert_response :success
  end
  
  test "admin should see Admin panel" do
    sign_out users(:kitty)
    sign_in users(:admin)
    get pages_home_url
    assert_response :success

    assert_select '#admin-panel', 1
    
  end
  
  test "Regular users should not see Admin panel" do
    get pages_home_url
    assert_response :success
    
    assert_select '#admin-panel', 0
  end

end
