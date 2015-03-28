class Vote < ActiveRecord::Base
  # associations
  belongs_to :voteable, polymorphic: :true
  belongs_to :user
  # validations
  before_save :is_owner

  private

  def is_owner
    if user == voteable.user && self.class.where(voteable_id: id, user_id: user)
      return false
    end
  end
end
