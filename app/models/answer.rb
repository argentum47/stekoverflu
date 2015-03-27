class Answer < ActiveRecord::Base
  # associations
  belongs_to :question, inverse_of: :answers

  has_one  :user, through: :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  #validations
  validates :content, length: { minimum: 30, maximum: 2000 }
end
