require "digest"

class Api::V1::SearchController < ApiController
  before_action :validate_params, :fixed_array, :md5, only: [:index]

  def index
    render json: get_result_from_cache
  end

  private

    def validate_params
      params.require([:checkin, :checkout, :destination, :guests])
    end

    def fixed_array
      ["id", "price", "supplier"]
    end

    def get_result
      suppliers = params[:suppliers].split(",")
      if suppliers.empty?
        Supplier.all
      else
        Supplier.where(:name => suppliers)
      end.map do |s|
        s.fetch_cheapest_from_url
      end.map {|x| fixed_array.zip(x).to_h}
    end

    def get_result_from_cache
      Rails.cache.fetch(@md5_key, expires_in: 5.minutes) do
        get_result
      end
    end

    def md5
      search_params= {
        checkin: params[:checkin],
        checkout: params[:checkout],
        destination: params[:destination],
        guests: params[:guests],
        suppliers: params[:suppliers]
      }
      @md5_key = Digest::MD5.hexdigest(search_params.to_s)
    end
end
