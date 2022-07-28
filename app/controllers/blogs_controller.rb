class BlogsController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def show
    render html: params
  end

  def create
    # 寫入資料庫
    render html: params
  end
end
