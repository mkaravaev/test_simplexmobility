require 'test_helper'

class Api::PhoneModelsControllerTest < ActionController::TestCase
  setup do
    @brand_models = PhoneModelsExtractorService.new("samsung")
    @brand_models.stub(models: [{title: 'alfa'}])
  end

  test "should return " do
    get :index, format: :json
    assert_response :success
   end
end
