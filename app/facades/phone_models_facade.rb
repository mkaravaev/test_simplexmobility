class PhoneModelsFacade
  def initialize(options)
    @options = options
  end

  def perform
    build = SiteParserService.new(@options, LinkFinderService.new)
    build.run
    build.strategy = PhonesListParsingService.new
    build.run
  end
end
