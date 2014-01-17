require 'test_helper'

class CommVotesControllerTest < ActionController::TestCase
  setup do
    @comm_vote = comm_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comm_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comm_vote" do
    assert_difference('CommVote.count') do
      post :create, comm_vote: { user_id: @comm_vote.user_id, vote_id: @comm_vote.vote_id }
    end

    assert_redirected_to comm_vote_path(assigns(:comm_vote))
  end

  test "should show comm_vote" do
    get :show, id: @comm_vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comm_vote
    assert_response :success
  end

  test "should update comm_vote" do
    put :update, id: @comm_vote, comm_vote: { user_id: @comm_vote.user_id, vote_id: @comm_vote.vote_id }
    assert_redirected_to comm_vote_path(assigns(:comm_vote))
  end

  test "should destroy comm_vote" do
    assert_difference('CommVote.count', -1) do
      delete :destroy, id: @comm_vote
    end

    assert_redirected_to comm_votes_path
  end
end
