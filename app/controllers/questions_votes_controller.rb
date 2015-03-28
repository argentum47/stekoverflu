class QuestionsVotesController < VotesController
  before_action :find_question

  def upvote
    vote = @question.votes.new(user_id: current_user.id)
    super(vote, @question)
  end

  def downvote
    vote = @question.votes.new(user_id: current_user.id)
    super(vote, @question)
  end

  private

  def find_question
    @question = Answer.find(params[:answer_id])
  end
end
