class Vote < ActiveRecord::Base
  # associations
  belongs_to :voteable, polymorphic: :true
end
