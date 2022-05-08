class InfoGameController < ApplicationController
	before_action :set_game

 	def show
    	render json: @game
  	end

  	private
    	# Use callbacks to share common setup or constraints between actions.
    	def set_game
      		@game = Game.joins(:user, :sport, :city, :state).select(:id, :user_id, :sport_id, :city_id, :state_id, :start, :end, :date, :address, :description, :name, :sport, :sport, :city, :state).where(id: params[:id])
    	end
end
