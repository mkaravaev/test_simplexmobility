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
      final_result << convert_result(result)
    end
    return final_result
  end

  private

  def convert_result(result)
    var = result.delete_if { |el| el.blank? }
    Hash[*var.flatten]
  end

end
