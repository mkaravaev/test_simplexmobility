class Api::PhoneModelsController < ApplicationController
  before_action :init_sites_for_parsing

  def index
    @phone_models = PhoneModelsFacade.new(phone_params)
    render json: @phone_models.perform, status: :ok
  end

  def show
    @phone_model = SiteParserService.new(
      phone_params,
      PhoneModelParsingService.new
    )
    render json: @phone_model.run, status: :ok
  end

  def search
    @phone_models = PhoneSearchFacade.new(phone_params)
    render json: @phone_models.perform, status: :ok
  end

  private

  def init_sites_for_parsing
    @sites = [Site::Gsmarena.new] #Add new site here
  end

  def sanitized_params
    params.permit(:brand_name, :models_links, :query)
  end

  def phone_params
    @sites.each do |site|
      sanitized_params.map do |key, val|
        site[key] = val
      end
    end
  end
end
