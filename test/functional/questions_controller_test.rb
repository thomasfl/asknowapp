require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

  setup do
    @user = users(:thomas)
    @question = questions(:one)
    @current_user = users(:thomas)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      # post :create, question: @question.attributes
      post :create, :question => {:description => "Do ya think i am sexy?"}
    end

    assert_redirected_to question_path(assigns(:question))
  end

  test "should show question" do
    get :show, id: @question.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question.to_param
    assert_response :success
  end

  test "should update question" do
    put :update, id: @question.to_param, question: @question.attributes
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question.to_param
    end

    assert_redirected_to questions_path
  end
end
