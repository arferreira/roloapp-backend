require 'test_helper'

class Backend::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backend_categories_index_url
    assert_response :success
  end

end
