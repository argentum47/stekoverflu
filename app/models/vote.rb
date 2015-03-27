class Vote < ActiveRecord::Base
  # associations
  belongs_to :voteable, polymorphic: :true
  belongs_to :user
  # validations
  before_save :is_owner

  private

  def is_owner
    if user == voteable.user
      errors.add(:base, "You Can't Vote Yourself")
      return false
    end
  end
end
