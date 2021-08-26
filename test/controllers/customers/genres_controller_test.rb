require 'test_helper'

class Customers::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_genres_index_url
    assert_response :success
  end

end
