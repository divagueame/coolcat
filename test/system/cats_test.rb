require "application_system_test_case"

class CatsTest < ApplicationSystemTestCase
  setup do
    @cat = cats(:Lupy)
    sign_in users(:kitty)
  end

  test "visiting the index" do
    visit cats_url
    assert_selector "h1", text: "Cats"
  end

  test "should create cat" do
    visit cats_url
    click_on "New cat"
    
    click_on "Create Cat"
  
    assert_text "Cat was successfully created"
    click_on "Back"
  end
  
  
  test "should update Cat in the user profile" do
    visit profile_index_path
    initial_name = @cat.name
    assert_text initial_name
    
    within id: dom_id(@cat) do
      page.find(:css, 'a > img.action_btn').click
    end
    
    fill_in 'cat_name', with: 'An updated kitty name'
      click_on "Update Cat"
    
    assert_text 'An updated kitty name'
    assert_no_text initial_name
    
  end

  test "should destroy Cat" do
    visit cat_url(@cat)
    click_on "Destroy this cat", match: :first

    assert_text "Cat was successfully destroyed"
  end
end
