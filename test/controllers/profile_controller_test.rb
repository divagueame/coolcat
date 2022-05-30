require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:kitty)
  end
  
  test "should get index if logged in" do
    get profile_index_url
    assert_response :success
  end
  
  test 'should redirec to sign up if NOT logged in' do
    sign_out users(:kitty)
    get profile_index_url

    assert_redirected_to new_user_session_path
  end

  test 'logged in users can click on the avatar to access profile path' do
    sign_out users(:kitty)
    sign_in users(:mike)
    get root_path
    assert_response :success

    assert_select '#header_partial .user_profile_link', 1
  end

end
