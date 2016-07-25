class Api::PhoneModelsController < ApplicationController

  def index
    @phone_models = PhoneModelsExtractorService.new(phone_brand_params[:brand])
    @phone_models.get_models
    render json: @phone_models.result, status: @phone_models.status
  end

  def show
    @phone_model = PhoneModelsExtractorService.new(phone_brand_params[:url])
    @phone_model.get_model
    render json: [@phone_model.result.first], status: @phone_model.status
  end

  def search
    @phone_models = PhoneModelsSearchService.new(phone_brand_params[:q])
    @phone_models.get_models
    render json: @phone_models.result, status: @phone_models.status
  end

  private

  def phone_brand_params
    params.permit(:brand, :url, :q)
  end
end
