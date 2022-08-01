class ArticlesController < ApplicationController

  def show
    find_article
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
    find_article
  end

  def update
    find_article
    if @article.update(article_params)
      redirect_to blogs_path, notice: '更新成功！'
    else
      render :edit
    end
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
