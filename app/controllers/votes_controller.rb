class VotesController < ApplicationController
  before_action :authenticate_user!, :find_post

  def upvote
    vote = @post.votes.new(user_id: current_user.id)
    vote.score = vote.score + 10
    unless vote.save
      @post.errors[:base] << "You cannot vote this!"
    end
  end

  def downvote
    vote = @post.votes.new(user_id: current_user.id)
    vote.score = vote.score - 2
    unless vote.save
      @post.errors[:base] << "You cannot vote this!"
    end
  end

  private

  def find_post
    @post = Question.find(params[:question_id]) if params[:question_id]
    @post = Answer.find(params[:answer_id]) if params[:answer_id]
  end
end
