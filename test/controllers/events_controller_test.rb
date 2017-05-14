require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @event = events(:one)
  # end

  test "home page loads" do
    get root_url
    assert_response :success
  end


end
