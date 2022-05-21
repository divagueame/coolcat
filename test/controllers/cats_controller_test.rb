require "test_helper"

class CatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cat = cats(:Lupy)
    sign_in users(:kitty)
  end

  test "should get index" do
    get cats_url
    assert_response :success
  end

  test "should get index if logged out" do
    sign_out users(:kitty)
    get cats_url
    assert_response :success
  end


  test "should get new if logged in" do
    get new_cat_url
    assert_response :success
  end


  test "should not get new if not logged in" do
    sign_out users(:kitty)
    get new_cat_url
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create cat" do
    assert_difference("Cat.count") do
      post cats_path, params: { 
        cat: {
          name: 'Chuki'
        }
      }
    end

    assert_redirected_to cat_url(Cat.last)
    assert_equal flash[:notice], 'Cat was successfully created.'
  end

  test "should create cat and upload a picture" do
    assert_difference("Cat.count") do
      post cats_path, params: { 
        cat: {
          name: 'Chuki',
          images: [fixture_file_upload("test_cat.jpg", "image/jpeg")]
        }
      }
    end
    
    assert_redirected_to cat_url(Cat.last)
    assert_equal flash[:notice], 'Cat was successfully created.'
    
    last_cat = Cat.order(:created_at).last
    assert last_cat.images.attached?
    
  end


  test "should create cat and without a picture" do
    assert_difference("Cat.count") do
      post cats_path, params: { 
        cat: {
          name: 'Chuki'
        }
      }
    end

    assert_redirected_to cat_url(Cat.last)
    assert_equal flash[:notice], 'Cat was successfully created.'

    last_cat = Cat.order(:created_at).last
    assert_not last_cat.images.attached?
  end





  test "should show cat" do
    get cat_url(@cat)
    assert_response :success
  end

  test "should get edit" do
    get edit_cat_url(@cat)
    assert_response :success
  end

  test "should update cat" do
    patch cat_url(@cat), params: {
      cat: {
        name: 'Chuki'
      }
    }
    assert_redirected_to cat_url(@cat)
  end

  test "should destroy cat" do
    assert_difference("Cat.count", -1) do
      delete cat_url(@cat)
    end

    assert_redirected_to cats_url
  end
end
