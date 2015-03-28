class QuestionsController < ApplicationController
  before_action :find_question, except: :index

  def index
    @questions = Question.filter(params[:tag])
  end

  def show
    @answers = @question.answers
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end
end
