class LinkExtractionService
  def run(context)
    result = []
    doc = Nokogiri::HTML(open(context.models_list_path))
    doc.css(context.brand_css).each do |node|
      node_search_result = context.find_brand_list_link.call(node)
      result << node_search_result if node_search_result.present?
    end
    context.models_links = result
  end
end
