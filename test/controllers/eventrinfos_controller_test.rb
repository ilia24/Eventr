require 'test_helper'

class EventrinfosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get eventrinfos_create_url
    assert_response :success
  end

  test "should get update" do
    get eventrinfos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get eventrinfos_destroy_url
    assert_response :success
  end

end
