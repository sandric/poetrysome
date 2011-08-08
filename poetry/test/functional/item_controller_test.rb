require 'test_helper'

class ItemControllerTest < ActionController::TestCase
  test "should get stroke_add" do
    get :stroke_add
    assert_response :success
  end

end
