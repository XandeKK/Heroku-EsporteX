class StatesController < ApplicationController
  before_action :set_state, only: %i[ show update destroy ]

  # GET /states
  def index
    @states = State.select(:id, :state).all

    render json: @states
  end
end
