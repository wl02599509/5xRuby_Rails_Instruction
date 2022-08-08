class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_user_article, only: [:edit, :update, :destroy]

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to "/", notice: "文章新增成功"
    else
      render "blogs/new"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to blogs_path, notice: "文章更新成功"
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to blogs_path, notice: "文章已刪除"
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :pincode)
  end

  def find_user_article
    @article = current_user.articles.find(params[:id])
  end
end
