class PhoneSearchFacade
  def initialize(options)
    @options = options
  end

  def perform
    build = SiteParserService.new(@options, PhonesListParsingService.new)
    build.run
    build.strategy = PhoneModelParsingService.new
    build.run
  end
end
