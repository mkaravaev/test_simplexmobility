require 'open-uri'

class PhoneModelsExtractorService
  attr_reader :result, :status

  def initialize(param)
    @param = param
    @result = []
  end

  def get_models
    link =  get_link
    get_brand_models(link)
  end

  def get_model
    result = {}
    doc = Nokogiri::HTML(open("http://gsmarena.com/" + @param))
    doc.css("div#specs-list table tr").each do |node|
      ttl = node.at_css("td.ttl")
      nfo = node.at_css("td.nfo")
      unless nfo.nil? && ttl.nil?
        result[ttl.text.strip] = nfo.text.strip
      end
    end
    @result << result
  end

  private

  def get_link
    doc = Nokogiri::HTML(open("http://gsmarena.com/makers.php3"))

    path = "div.st-text table tr td"

    doc.css(path).each do |node|
      node.at_css("a span").remove
      if node.text.split.first == @param.capitalize
        return "gsmarena.com/" + node.at_css("a")['href']
        break
      end
    end
  end

  def get_brand_models(link)
    form_link = "http://" + link
    doc = Nokogiri::HTML(open(form_link))

    path = "div.makers ul li"

    doc.css(path).each do |node|
      node_link = node.at_css("a")['href']
      node_title = node.at_css("a strong span").text.strip
      @result << { link: node_link, title: node_title }
    end
  end
end
