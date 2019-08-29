require 'test_helper'

class TwitterUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get twitter_users_index_url
    assert_response :success
  end

end
