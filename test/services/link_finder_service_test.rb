require 'test_helper'

class LinkFinderServiceTest < ActiveSupport::TestCase

  setup do
    @link_finder = LinkFinderService.new
    @options = Site::Gsmarena.new
    @options.brand_name = "yota"
  end

  test "should find brand path by brand name" do
    expected = "yota-phones-99.php"
    @link_finder.run(@options)
    result = @options.models_links
    assert_equal expected, result
  end
end

