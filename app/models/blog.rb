class Blog < ApplicationRecord
  acts_as_paranoid

  #relationship
  belongs_to :user

  has_many :blog_visitors
  has_many :visited_users, through: :blog_visitors, source: :user

  #validations
  validates :handler, presence: true, uniqueness: true
  validates :title, presence: true
end
