require 'test_helper'

class StandingsControllerTest < ActionController::TestCase
  setup do
    @standing = standings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:standings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create standing" do
    assert_difference('Standing.count') do
      post :create, standing: { initials: @standing.initials, location: @standing.location, player_id: @standing.player_id, score: @standing.score }
    end

    assert_redirected_to standing_path(assigns(:standing))
  end

  test "should show standing" do
    get :show, id: @standing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @standing
    assert_response :success
  end

  test "should update standing" do
    patch :update, id: @standing, standing: { initials: @standing.initials, location: @standing.location, player_id: @standing.player_id, score: @standing.score }
    assert_redirected_to standing_path(assigns(:standing))
  end

  test "should destroy standing" do
    assert_difference('Standing.count', -1) do
      delete :destroy, id: @standing
    end

    assert_redirected_to standings_path
  end
end
