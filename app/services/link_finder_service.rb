require 'open-uri'

class LinkFinderService
  def run(context)
    doc = Nokogiri::HTML(open(context.models_list_path))
    doc.css(context.brand_css).each do |node|
      node_search_result = context.find_brand_list_link.call(node)
      context.models_links = node_search_result if node_search_result.present?
    end
  end
end
