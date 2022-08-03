class User < ApplicationRecord
  validates :email, 
             presence: true,
             uniqueness: true

  validates :password, 
             presence: true, 
             length: { minimum: 6 },
             confirmation: true

  #callback
  before_create :encrypt_password

  def encrypt_password
    # require "digest" # Rails 環境內已經有 "digest" 了
    pw = "xx-#{self.password}-yy"
    self.password = Digest::SHA1.hexdigest(pw)
  end
  
end
