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

  test "header partial should be present in root" do
    get root_path

    assert_response :success
    assert_select '#header_partial', 1
  end
  

  test "if logged in and user has avatar, it should load on header partial" do
    sign_out users(:kitty)
    sign_in users(:mike)
    
    p 'Avatar present??'
    pp users(:mike).avatar.present?
    pp users(:mike).avatar
    
    get root_path
    assert_response :success

    assert_select '#header_partial', 1
    assert_select '#header_avatar', 1
    assert_select 'img', 1

  end

end
