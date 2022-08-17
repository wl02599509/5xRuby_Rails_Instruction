class Api::V1::ArticlesController < ApplicationController
  before_action :authenticate_user!

  def not_available_dates
    render json: ["2022-08-20", "2022-08-21", "2022-08-22"]
  end

  def like
    article = Article.find(params[:id])

    if current_user.liked_articles.include?(article)
      # 移除讚
      current_user.liked_articles.destroy(article)
      render json: {state: "unliked", id: params[:id]}
    else
      # 新增讚
      current_user.liked_articles << article
      render json: {state: "liked", id: params[:id]}
    end
  end
end
