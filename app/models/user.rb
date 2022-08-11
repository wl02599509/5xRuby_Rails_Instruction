class User < ApplicationRecord
  # relationship
  has_one :blog
  has_many :articles
  has_many :comments
  
  has_many :like_articles
  has_many :liked_articles, 
            through: :like_articles, source: :article

  has_many :blog_visitors
  has_many :visitors, through: :blog_visitors, source: :blog

  # validations
  validates :email, 
             presence: true,
             uniqueness: true

  validates :password, 
             presence: true, 
             length: { minimum: 6 },
             confirmation: true

  # callback
  before_create :encrypt_password

  def encrypt_password
    # require "digest" # Rails 環境內已經有 "digest" 了
    pw = "xx-#{self.password}-yy"
    self.password = Digest::SHA1.hexdigest(pw)
  end
  
  def self.login(user_params)
    email = user_params[:email]
    pw = user_params[:password]
    
    hashed_password = Digest::SHA1.hexdigest("xx-#{pw}-yy")

    find_by(email: email, password: hashed_password)
  end

  def like?(article)
    liked_articles.include?(article)
  end


end
