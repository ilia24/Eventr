require 'test_helper'

class HostinfosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get hostinfos_create_url
    assert_response :success
  end

  test "should get update" do
    get hostinfos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get hostinfos_destroy_url
    assert_response :success
  end

end
