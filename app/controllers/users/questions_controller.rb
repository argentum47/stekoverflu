class Users::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: [:edit, :update, :show, :destroy]

  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save && @question.build_vote.save
      redirect_to @question
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question
  end

  private

  def find_question
    @question = current_user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content)
  end

end
