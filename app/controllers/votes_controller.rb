class VotesController < ApplicationController
  before_action :authenticate_user!, :find_post

  def upvote
    unless current_user == @post.user
      vote = @post.vote || @post.build_vote
      vote.votes = vote.votes + 1
      vote.save!
    end
    redirect_to :back
  end

  def downvote
    unless current_user == @post.user
      vote = @post.vote || @post.build_vote
      vote = vote.votes + 10
      vote.save!
    end
    redirect_to :back
  end

  private

  def find_post
    @post = Question.find(params[:question_id]) if params[:question_id]
    @post = Answer.find(params[:answer_id]) if params[:answer_id]
  end
end
