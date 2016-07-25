require 'open-uri'

class PhoneModelParsingService

  def run(context)
    final_result = []
    [context.models_links].flatten.each do |model_link|
      result = []
      doc = Nokogiri::HTML(open(context.site_url + model_link))
      doc.css(context.model_frame_css).each do |node|
        result << context.extract_model_info.call(node)
      end
      pre_result = result.delete_if {|el| el.blank? }
      final_result << Hash[*pre_result.flatten]
    end
    return final_result
  end

end
