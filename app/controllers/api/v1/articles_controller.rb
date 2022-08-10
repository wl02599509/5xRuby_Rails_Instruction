class Api::V1::ArticlesController < ApplicationController
  def like
    render json: {name: "kk", age: 18, id: params[:id]}
  end
end
