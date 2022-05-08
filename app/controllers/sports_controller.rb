class SportsController < ApplicationController
  before_action :set_sport, only: %i[ show update destroy ]

  # GET /sports
  def index
    @sports = Sport.select(:id, :sport, :image).all

    render json: @sports
  end
end
