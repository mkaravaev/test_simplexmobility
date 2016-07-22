require 'open-uri'

class PhoneModelsExtractorService
  attr_reader :models, :status

  def initialize(brand)
    @brand = brand
  end

  def run
    get_link
    get_brand_models(link)
  end

  private

  def get_brand_models(link)
    form_link = "http://" + link
    doc = Nokogiri::HTML(open(form_link))
  end

  def get_link
  end
end
