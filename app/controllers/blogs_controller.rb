class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @articles = Article.order(id: :desc)
    @ad_color_red = "Red"
    @ad_color_green = "green"
    @ad_color_orange = "orange"
  end

  def new
    @article = Article.new
  end
end
