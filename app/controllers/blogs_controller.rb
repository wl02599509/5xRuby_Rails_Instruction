class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    # /:id
  end

  def new
    @blog = Blog.new
  end

  def create
    render html: params
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
