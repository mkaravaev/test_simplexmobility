class Api::PhoneModelsController < ApplicationController

  def index
    binding.pry
    @result = ::PhoneModelsExtractorService.new(phone_brand_params)
    #render :json, serializer: PhonesModelsSerializer, status: :ok 
  end

  private

  def phone_brand_params
    params.permit(:brand)
  end
end
