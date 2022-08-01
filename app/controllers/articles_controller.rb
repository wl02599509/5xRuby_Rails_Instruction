class ArticlesController < ApplicationController
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to "/"
    else
      render "blogs/new"
      # 借 app/views/blogs/new.html.erb 來用

      # redirect_to "/blogs/new"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :content)
  end
end
