class BlogsController < ApplicationController
  def index
  end

  def new
  end

  def create
    redirect_to '/blogs', notice: '已成功新增文章'
  end
end
