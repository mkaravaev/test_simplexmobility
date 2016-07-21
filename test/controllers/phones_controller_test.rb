require 'test_helper'

class PhonesControllerTest < ActionController::TestCase
  setup do
    @phone = phones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phones)
  end
end
