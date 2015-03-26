class AddScoreToQuestionsAnswers < ActiveRecord::Migration
  def change
    add_column :questions, :score, :integer, default: 0
    add_column :answers, :score, :integer, default: 0

    Question.all.each do |q|
      q.update(score: (q.vote.try(:votes) || 0) * 10)
    end

    Answer.all.each do |a|
      a.update(score: (a.vote.try(:votes) || 0) * 10)
    end
  end
end
