class ArticlesController < ApplicationController

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to '/', notice: '新增成功！'
    else
      redirect_to '/blogs/new'
    end
  end


  private
  def article_params
    params.require(:article).permit(:title, :content)
  end

end
