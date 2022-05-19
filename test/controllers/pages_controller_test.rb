require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:kitty)
  end


  test "should get home" do
    get pages_home_url
    assert_response :success
  end
end
