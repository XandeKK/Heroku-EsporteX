class GamesController < ApplicationController
  before_action :set_game, only: %i[ show update destroy ]

  # GET /games
  def index
    time = Time.new
    time = time.year.to_s + "-" + time.month.to_s + "-" + time.day.to_s
    @games = Game.joins(:user, :sport).select(:id, :user_id, :sport_id, :start, :end, :date, :address, :name, :sport).where(sport_id: params[:sport_id]).where("date >= ?", time)

    render json: @games
  end

  # GET /games/1
  def show
    render json: @game
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created, location: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /games/1
  def update
    @game = Game.where(id: params[:id])
    if @game.update(game_params)
      render json: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game = Game.where(id: params[:id])
    @game.destroy(params[:id])
    render json: {"sucess": 1}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      time = Time.new
      time = time.year.to_s + "-" + time.month.to_s + "-" + time.day.to_s
      @game = Game.joins(:user, :sport).select(:id, :user_id, :sport_id, :start, :end, :date, :address, :name, :sport).where(sport_id: params[:sport_id], state_id: params[:state_id], city_id: params[:city_id]).where.not(user_id: params[:user_id]).where("date >= ?", time)
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:user_id, :sport_id, :city_id, :state_id, :start, :end, :date, :address, :description)
    end
end
