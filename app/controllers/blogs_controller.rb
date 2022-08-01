class BlogsController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # 寫入資料庫
    # redirect_to '/blogs', notice: '已成功新增文章'
    render html:params[:content]
  end
end
