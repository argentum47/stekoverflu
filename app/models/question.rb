class Question < ActiveRecord::Base
  # associations
  belongs_to :user, inverse_of: :questions

  has_many :answers, inverse_of: :question, dependent: :destroy
  has_one :vote, as: :voteable
  has_many :comments, as: :commentable

  has_and_belongs_to_many :tags

  #validations

  validates :title, length: { maximum: 200 }
  vaidates  :content, length: { minimum: 30, maximum: 2000 }


  private

  def has_voted
    # check if already voted
  end
end
