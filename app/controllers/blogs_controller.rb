class BlogsController < ApplicationController
  include UsersHelper
  
  def index
    @articles = Article.all
    @ad_color_red = "Red"
    @ad_color_green = "green"
    @ad_color_orange = "orange"
  end

  def new
    if user_sign_in?
      @article = Article.new
    else
      redirect_to sign_in_users_path
    end
  end

end
