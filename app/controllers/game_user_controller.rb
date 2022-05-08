class GameUserController < ApplicationController
	before_action :set_game

	def show
		render json: @game
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_game
			@game = Game.joins(:user, :sport).select(:id, :user_id, :sport_id, :start, :end, :date, :address, :name, :sport).where(user_id: params[:id])
		end
end
