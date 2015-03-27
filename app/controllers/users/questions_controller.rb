class Users::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: [:edit, :update, :show, :destroy]

  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.new(question_params)
    tags = params["question_tags"].collect(&:to_i).uniq
    @question.tags << Tag.where(id: tags)

    if @question.save
      Tag.update_counters(tags, tags_count: 1)
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
    params.require(:question).permit(:title, :content, tags: [])
  end

end
