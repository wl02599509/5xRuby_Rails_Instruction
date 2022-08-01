class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_fund

	def not_fund
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end
end
