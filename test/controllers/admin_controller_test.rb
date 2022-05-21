require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
  end
  
  test 'admin should got admin index' do
    get admin_path
    assert_response :success
    assert_select '#admin-panel', 1
  end
      
  test 'non admin should redirect to pages home' do
    sign_out users(:admin)
    sign_in users(:kitty)
    get admin_path
    assert_response :redirect
    assert_select '#admin-panel', 0
  end

end
