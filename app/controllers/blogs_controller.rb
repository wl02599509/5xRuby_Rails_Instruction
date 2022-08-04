class BlogsController < ApplicationController
  before_action :require_login, only: [:new]
  
  def index
    @articles = Article.all
    @ad_color_red = "Red"
    @ad_color_green = "green"
    @ad_color_orange = "orange"
  end

  def new
    @article = Article.new
  end
end
