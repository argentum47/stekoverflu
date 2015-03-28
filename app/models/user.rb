class User < ActiveRecord::Base
  has_many :questions, dependent: :nullify
  has_many :answers, through: :questions, dependent: :nullify

  has_many :profiles, inverse_of: :user, dependent: :destroy

  before_save :reject_if_negative

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid      = auth["uid"]
      user.name     = auth["info"]["name"]
      user.email    = auth["info"]["email"]
      user.avatar   = auth["info"]["image"]
      user.nickname = auth["info"]["nickname"] || "user#{Time.now.to_i}"
    end

  rescue Exception => e
    errors.add :base, "Github Validation Failed"
  end

  def add_points(score)
    user.points = user.points + score
    user.save(false)
  end

  def reject_if_negative
    points < 1 ? false : true
  end
end
