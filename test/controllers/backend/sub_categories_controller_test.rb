require 'test_helper'

class Backend::SubCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backend_sub_categories_index_url
    assert_response :success
  end

end
