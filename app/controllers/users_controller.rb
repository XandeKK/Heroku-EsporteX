require 'digest'

class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # POST /users
  def create
    if params[:task] == "1" # Login
      password = password_hash(params[:password])
      @user = User.select(:id, :name, :email, :image, :twitter, :instagram, :description).where(email: params[:email], password: password)
      
      if @user.empty?
        return {"sucess": 0}
      else
        @user = @user[0]

        @user_address = UserAddress.joins(:user, :state, :city).select(:user_id, :id, :state_id, :city_id, :city, :state).where(user_id: @user["id"].to_s)
        @user_address = @user_address[0]


        json_tmp = {address_id: @user_address["id"], sucess: 1, user_id: @user["id"], name: @user["name"], email: @user["email"], image: @user["image"], twitter: @user["twitter"], instagram: @user["instagram"], description: @user["description"],
          state: @user_address["state"], state_id: @user_address["state_id"], city_id: @user_address["city_id"], city: @user_address["city"]}

        render json: json_tmp
      end

    elsif params[:task] == "2" # verifica se o email existe
      if (User.exists?(:email => params[:email]))
        render json: {exists: 1}
      else
        render json: {exists: 0}
      end

    else # Criação de usuário
      params_tmp = user_params
      params_tmp[:password] = password_hash(params_tmp[:password])

      @user = User.new(params_tmp)

      if @user.save
        render json: {"id": @user[:id], "sucess": 1}
      else
        render json: {"sucess": 0}
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: {"sucess": 1}
    else
      render json: {"sucess": 0}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :image, :twitter, :instagram, :description, :password)
    end

    def password_hash(password)
      hash = Digest::SHA256.hexdigest(password + "Vapo")
    end
end
