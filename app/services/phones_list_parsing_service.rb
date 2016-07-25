require 'open-uri'

class PhonesListParsingService

  def run(context)
    result = []
    doc = Nokogiri::HTML(open(context.models_link_path))
    doc.css(context.model_css).each do |node|
      result << context.find_brand_links_and_titles.call(node)
      context.models_links = result.map{|x| x[:link]}
    end
    result
  end
end
