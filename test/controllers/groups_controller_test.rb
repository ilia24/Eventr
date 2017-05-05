require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get groups_show_url
    assert_response :success
  end

  test "should get create" do
    get groups_create_url
    assert_response :success
  end

  test "should get destory" do
    get groups_destory_url
    assert_response :success
  end

end
