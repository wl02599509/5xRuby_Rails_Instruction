class Article < ApplicationRecord
  # relationship
  belongs_to :user
  
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
