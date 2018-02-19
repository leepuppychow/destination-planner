class Api::V1::DestinationsController < ActionController::API

  def index
    render json: Destination.all
  end

  def show
    render json: Destination.find(params[:id])
  end

end
