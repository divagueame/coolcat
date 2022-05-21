require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
  end
  
  test 'admin should got admin index' do
    get admin_path
    assert_response :success
    assert_select '#admin-panel', 1
    assert_equal flash[:notice], 'Admin Mode Activated 01101101011011001001110110110010111011101100100101'
  end
  
  test 'non admin should redirect to pages home' do
    sign_out users(:admin)
    sign_in users(:kitty)
    get admin_path
    assert_response :redirect
    assert_select '#admin-panel', 0
    assert_equal flash[:alert], 'No chiki chiki please...'
  end

end
