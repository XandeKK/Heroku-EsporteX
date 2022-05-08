require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url, as: :json
    assert_response :success
  end

  test "should create game" do
    assert_difference("Game.count") do
      post games_url, params: { game: { address: @game.address, city_id: @game.city_id, date: @game.date, description: @game.description, end: @game.end, sport_id: @game.sport_id, start: @game.start, state_id: @game.state_id, user_id: @game.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show game" do
    get game_url(@game), as: :json
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { address: @game.address, city_id: @game.city_id, date: @game.date, description: @game.description, end: @game.end, sport_id: @game.sport_id, start: @game.start, state_id: @game.state_id, user_id: @game.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy game" do
    assert_difference("Game.count", -1) do
      delete game_url(@game), as: :json
    end

    assert_response :no_content
  end
end
