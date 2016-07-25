require 'test_helper'
include ResponseData

#include results

class PhoneModelParsingServiceTest < ActiveSupport::TestCase

  setup do
    @model_parser = PhoneModelParsingService.new
    @options = Site::Gsmarena.new
  end

  test "should get model info by model page" do
    @options.models_links = ["yota_yotaphone-6961.php"]
    assert_equal [yota_result], @model_parser.run(@options)
  end

  test "should get several models info" do
    @options.models_links = ["yota_yotaphone-6961.php", "apple_ipad_mini_4-7561.php"]
    assert_equal [yota_result, ipad_result], @model_parser.run(@options)
  end

  test "should strip model info from empty arrays" do
    expected = {'test'=> 'test'}
    array = [['test', 'test'], nil, []]
    assert_equal expected, @model_parser.send(:convert_result, array)
  end
end
