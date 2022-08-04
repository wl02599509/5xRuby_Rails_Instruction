class Article < ApplicationRecord
  # relationship
  belongs_to :user
  
  # validations
  validates :title, presence: true
end
