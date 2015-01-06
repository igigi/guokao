class ArticlesController < ApplicationController
  def index
      articles = Article.where(province: params[:province]).page(params[:page]).per(18)
      render json: articles
  end
end
