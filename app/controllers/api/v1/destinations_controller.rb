class Api::V1::DestinationsController < ActionController::API

  def index
    render json: Destination.all
  end

  def show
    render json: Destination.find(params[:id])
  end

  def create
    render json: Destination.create(destination_params)
  end

  def update
    render json: Destination.find(params[:id]).update(destination_params)
  end

  def destroy
    Destination.find(params[:id]).destroy
  end

  private

    def destination_params
      params.require(:destination).permit(:name, :zip, :description, :image_url)
    end

end
