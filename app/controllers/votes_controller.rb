class VotesController < ApplicationController
  before_action :authenticate_user!

  def upvote(vote, parent)
    vote.score = vote.score + 10
    vote.save ? user.add_points(vote.score)
              : parent.errors[:base] << "You cannot vote this!"
  end

  def downvote(vote, parent)
    vote.score = vote.score - 2
    vote.save ? user.add_points(vote.score)
              : parent.errors[:base] << "You cannot vote this!"
  end
end
