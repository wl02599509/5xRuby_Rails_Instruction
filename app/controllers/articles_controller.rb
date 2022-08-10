# Authentication 認證  -->  手上有session、手上有卡進出補習班
# Authorization 授權  --> 但未被授權編輯其他人文章、進出其他教室
class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :unlock]
  before_action :find_user_article, only: [:edit, :update, :destroy]
  before_action :find_article, only: [:show, :unlock]
    
  def show
    authenticate_user! if @article.pin_code.present?

    @comment = Comment.new
    @comments = @article.comments.order(id: :desc)
  end

  def create

    # @article = Article.new(article_params)
    # @article.user = current_user

    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to about_path, notice: '新增成功！'
    else
      render '/blogs/new'
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

  def unlock
    if @article.pin_code == params[:pin_code]
      set_unlock_articles(@article.id)
      redirect_to article_path(@article.id)
    else
      redirect_to article_path(@article), notice: '密碼錯誤'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :pin_code)
  end

  def find_user_article
    # @article = Article.find_by(id: params[:id])
    @article = current_user.articles.find(params[:id])
  end

  def find_article 
    @article = Article.find(params[:id])
  end

  def set_unlock_articles(article_id)
    if session[:unlock_articles]
      session[:unlock_articles] << article_id
      session[:unlock_articles].uniq!
    else
      session[:unlock_articles] = [article_id]
    end
  end

end
