class SiteParserService
  def initialize(options, parse_type)
    @site = options.site
    @frame_css = options.frame_css
    @node_info_css = options.info_css
    @node_total_css = options.total_css
    @parse_type = parse_type
    @form_link = option.brand_name
  end

  def parse
    @parse_type.run(self)
  end
end
