class InfoProfileController < ApplicationController
	  before_action :set_user_address

  def show
    render json: @user_address
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_address
      @user_address = UserAddress.joins(:user, :state, :city).select(:user_id, :id, :state_id, :city_id, :city, :state, :name, :twitter, :instagram, :description, :image).where(user_id: params[:id])
    end
end
