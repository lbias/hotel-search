class Api::V1::SearchController < ApiController
  before_action :validate_params, only: [:index]

  def index
    suppliers = params[:suppliers].split(",")
    result = if suppliers.empty?
        Supplier.all
      else
        Supplier.where(:name => suppliers)
      end.map do |s|
        s.fetch_cheapest_from_url
      end
    keys = ["id", "price", "supplier"]
    render json: result.map {|x| keys.zip(x).to_h}
  end

  private

    def validate_params
      params.require([:checkin, :checkout, :destination, :guests])
    end
end
