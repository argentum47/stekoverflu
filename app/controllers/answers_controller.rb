class AnswersController < ApplicationController
  before_action :authenticate_user!,  except: :show
  before_action :authenticate_owner!, only: [:edit, :update, :destroy]
  before_action :find_question

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to @question, flash: { success: "Answer Posted successfully!!" }
    else
      redirect_to @question, flash: { errors: @answer.errors.full_messages.to_sentence}
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:content)
  end

  def authenticate_owner!
    if current_user
      @answer = current_user.questions.find(params[:question_id]).answers.find(params[:id])
    end
  end
end
