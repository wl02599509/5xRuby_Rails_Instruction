class Article < ApplicationRecord
  # relationship
  belongs_to :user
  has_many :comments
  
  has_many :like_articles
  has_many :users, through: :like_articles
  
  # validations
  validates :title, presence: true

  # scope :available, -> { where(deleted_at: nil) }
  default_scope { where(deleted_at: nil) }
  #Lambda, callback function
  # def self.available
  #   where(deleted_at: nil)
  # end

 
  def destroy
    update(deleted_at: Time.current)
  end
end
