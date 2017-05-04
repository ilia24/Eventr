require 'test_helper'

class HostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hosts_new_url
    assert_response :success
  end

  test "should get create" do
    get hosts_create_url
    assert_response :success
  end

  test "should get show" do
    get hosts_show_url
    assert_response :success
  end

  test "should get destroy" do
    get hosts_destroy_url
    assert_response :success
  end

end
