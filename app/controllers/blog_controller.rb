class BlogController < ApplicationController
  def index
  end

  def new
  end

  def create
    redirect_to '/blog', notice: '已成功新增文章'
  end
end
