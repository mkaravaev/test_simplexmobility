require 'open-uri'

class PhoneModelsSearchService
  attr_reader :result, :status

  def initialize(param)
    @param = param
    @result = []
    @links = []
  end

  def get_models
    phones_links = get_phones_links(@param)
    get_models_info(phones_links.map{|el| el[:link]})
  end

  def get_models_info(links)

    links.each do |link|
      result = {}
      doc = Nokogiri::HTML(open("http://gsmarena.com/" + link))
      doc.css("div#specs-list table tr").each do |node|
        ttl = node.at_css("td.ttl")
        nfo = node.at_css("td.nfo")
        unless nfo.nil? && ttl.nil?
          result[ttl.text.strip] = nfo.text.strip
        end
      end
      @result << result
    end
  end

  private

  def get_link(link)
    url = "http://gsmarena.com/results.php3?sQuickSearch=yes&sName=" + link
    doc = Nokogiri::HTML(open(url))
    path = "div.st-text table tr td"

    doc.css(path).each do |node|
      node.at_css("a span").remove
      if node.text.split.first == @param.capitalize
        return "gsmarena.com/" + node.at_css("a")['href']
      end
    end
  end

  def get_phones_links(query)
    url = "http://gsmarena.com/results.php3?sQuickSearch=yes&sName=" + query
    doc = Nokogiri::HTML(open(url))

    path = "div.makers ul li"

    doc.css(path).each do |node|
      node_link = node.at_css("a")['href']
      node_title = node.at_css("a strong span").text.strip
      @links << { link: node_link, title: node_title }
    end
    @links
  end
end
