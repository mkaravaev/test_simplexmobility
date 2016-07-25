module Site
  class Gsmarena < Struct.new(:brand_name, :models_links)
    SITE_URL = "http://www.gsmarena.com/"
    MODELS_LIST_PATH = "makers.php3"
    MODELS_TABLE_CSS = "div.makers ul li"
    MODEL_FRAME_CSS = "div#specs-list table tr"

    def options
    end

    def site_url
      SITE_URL
    end

    def models_list_path
      SITE_URL + MODELS_LIST_PATH
    end

    def model_frame_css
      MODEL_FRAME_CSS
    end

    def brand_css
      "div.st-text table tr td"
    end

    def model_css
      MODELS_TABLE_CSS
    end

    def model_total_css
      "td.ttl"
    end

    def model_info_css
      "td.nfo"
    end

    def extract_model_info
      lambda do |node|
        ttl = node.at_css(self.model_total_css)
        nfo = node.at_css(self.model_info_css)
        unless nfo.nil? && ttl.nil?
          return [ttl.text.strip, nfo.text.strip]
        end
      end
    end

    def find_brand_link
      lambda do |node|
        node_link = node.at_css("a")['href']
        node_title = node.at_css("a strong span").text.strip
        { link: node_link, title: node_title }
      end
    end

    def find_brand_list_link
      lambda do |node|
        node.at_css("a span").remove
        if node.text.split.first == self.brand_name.capitalize
          return node.at_css("a")['href']
        end
      end
    end

  end
end

