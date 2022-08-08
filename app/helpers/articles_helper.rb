module ArticlesHelper
  def is_locked?(article)
    article.pin_code.present? && !session[:unlock_articles]&.include?(params[:id].to_i)
  end
end
