module QuestionFilters
  extend ActiveSupport::Concern

  class_methods do
    def filter(option)
      case option
      when "newest"
        order("updated_at DESC")
      when "trending"
        includes(:votes).where(votes: { score: 60..Float::INFINITY })
      when "unanswered"
        where.not(id: Answer.pluck(:question_id))
      else
        all
      end
    end
  end
end
