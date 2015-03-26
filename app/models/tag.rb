class Tag < ActiveRecord::Base
  # associations
  has_and_belongs_to_many :questions

  # validations
  validates :name, length: { minimum: 3, maximum: 50 }
end
