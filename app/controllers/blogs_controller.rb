class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def show
    @blog = Blog.find_by!(handler: params[:handler])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.build_blog(blog_params)

    if @blog.save
      redirect_to "/@#{@blog.handler}", notice: "已建立 Blog"
    else
      render :new
    end

    #誰來我家
    if @blog != current_user.blog
      if @blog.visitors.include?(current_user)
        @blog.visitors.destroy(current_user)
      end
      
      @blog.visitors << current_user
    end
  end

  def edit
    @blog = current_user.blog
  end

  def update
    @blog = current_user.blog

    if @blog.update(blog_params)
      redirect_to blogs_path(handler: @blog.handler), notice: '更新成功！'
    else
      render :edit
    end
  end

  def destroy
  end

  private
  
  def blog_params
    # 避免讓不可被修改的 handler 被他人透過網頁端新增欄位進行修改。 
    if action_name != "update"
      params.require(:blog).permit(:handler, :title, :description)
    else
      params.require(:blog).permit(:title, :description)
    end
  end

  def find_blog
    @blog = Blog.find_by!(handler: params[:handler])
  end
end
