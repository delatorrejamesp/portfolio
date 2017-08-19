class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "james", password: "p@$$w0rd", except: [:index, :show]

  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :text))

    @article.save
    redirect_to @article
  end
end