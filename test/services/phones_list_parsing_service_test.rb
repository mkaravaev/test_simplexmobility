require 'test_helper'

class PhonesListParsingServiceTest < ActiveSupport::TestCase

  setup do
    @models_parser = PhonesListParsingService.new
    @options = Site::Gsmarena.new
  end

  test "should extract all phones links and titles from given page" do
    @options.models_links = "yota-phones-99.php"
    expected = [{:link=>"yota_yotaphone_2-6959.php", :title=>"YotaPhone 2"}, {:link=>"yota_yotaphone-6961.php", :title=>"YotaPhone"}]
    result = @models_parser.run(@options)
    assert_equal expected, result
  end

  test "should save links to site config object" do
    @options.models_links = "yota-phones-99.php"
    expected = ["yota_yotaphone_2-6959.php", "yota_yotaphone-6961.php"]
    @models_parser.run(@options)
    assert_equal expected, @options.models_links
  end

  test "should extract all found phones links and titles from given query" do
    @options.query = "b2000"
    expected = [{:link=>"lg_b2000-1134.php", :title=>"LGB2000"}, {:link=>"nec_db2000-156.php", :title=>"NECDB2000"}]
    assert_equal expected, @models_parser.run(@options)
  end

  test "should save all found links to site config object" do
    @options.query = "b2000"
    expected = ["lg_b2000-1134.php", "nec_db2000-156.php"]
    @models_parser.run(@options)
    assert_equal expected, @options.models_links
  end
end
