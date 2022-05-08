class ParticipationsController < ApplicationController
  before_action :set_participation, only: %i[ show update destroy ]

  # GET /participations/1
  def show
    if params[:task] == "1" # Verificar se o usuário está participando do jogo
      if @participation.empty?
        render json: {"participate": 0}
      else
        puts @participation.count
        render json: {"participate": 1}
      end
    elsif params[:task] == "2" # renderizar a lista de usuários daquele jogo
      @participation = Participation.joins(:user).select(:user_id, :game_id, :name).where(game_id: params[:id])
      render json: @participation

    elsif params[:task] == "3" # Verificar a contagem do usuario de qualquer jogo
      @participation = Participation.where(user_id: params[:user_id]).count
      render json: {"count": @participation}
    end
  end

  # POST /participations
  def create
    @participation = Participation.new(participation_params)

    if @participation.save
      render json: {"sucess": 1}
    else
      render json: {"sucess": 0}
    end
  end

  # DELETE /participations/1
  def destroy
    @participation.where(game_id: params[:id], user_id: params[:user_id]).destroy_all
    render json: {"sucess": 1}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.where(game_id: params[:id], user_id: params[:user_id ])
    end

    # Only allow a list of trusted parameters through.
    def participation_params
      params.require(:participation).permit(:user_id, :game_id)
    end
end
