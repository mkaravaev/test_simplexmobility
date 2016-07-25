require 'open-uri'

class PhonesListParsingService

  def run(context)
    result = []
    context.models_links.each do |model_link|
      doc = Nokogiri::HTML(open(context.site_url + model_link))
      doc.css(context.model_css).each do |node|
        result << context.find_brand_link.call(node)
      end
    end
    result
  end
end
