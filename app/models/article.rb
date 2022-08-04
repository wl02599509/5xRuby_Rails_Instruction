class Article < ApplicationRecord
  # relationships
  belongs_to :user

  # validations
  validates :title, presence: true,
                    length: { minimum: 2 }
end
