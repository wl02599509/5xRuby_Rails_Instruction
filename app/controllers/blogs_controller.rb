class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @articles = Article.where(deleted_at: nil).order(id: :desc)
  end

  def new
    @article = Article.new
  end
end
