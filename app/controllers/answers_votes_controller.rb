class AnswersVotesController < VotesController
  before_action :find_answer

  def upvote
    vote = @answer.votes.new(user_id: current_user.id)
    super(vote, @answer)
  end

  def downvote
    vote = @answer.votes.new(user_id: current_user.id)
    super(vote, @answer)
  end

  private

  def find_answer
    @answer = Answer.find(params[:answer_id])
  end
end
