# Authentication 認證  -->  手上有session、手上有卡進出補習班
# Authorization 授權  --> 但未被授權編輯其他人文章、進出其他教室
class ArticlesController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to about_path, notice: '新增成功！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to blogs_path, notice: '更新成功！'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to blogs_path, notice: '刪除成功！'
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    # @article = Article.find_by(id: params[:id])
    @article = Article.find(params[:id])
  end

end
