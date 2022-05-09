class CitiesController < ApplicationController
  before_action :set_city, only: %i[ show update destroy ]

  # GET /cities/1
  def show
    render json: @city
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.where(state_id: params[:state_id])
    end

    # Only allow a list of trusted parameters through.
    def city_params
      params.require(:city).permit(:city, :state_id)
    end
end
