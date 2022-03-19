class CampersController < ApplicationController
  def index
    campers = Camper.all
    render json: campers
  end

  def show
    camper = Camper.find_by!(id: params[:id])
    render json: camper, serializer: CamperSummarySerializer
  end

  def create 
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  private

  def camper_params
    params.permit(:name, :age)
  end

end
