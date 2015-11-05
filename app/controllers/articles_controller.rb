class ArticlesController < ApplicationController
  def index
    @articles = Article.status_active
  end
  
  def show
    @article = Article.find_by_id(params[:id])
  end
  
  def edit
    @article = Article.find_by_id(params[:id])
  end
  
  def update
    @article = Article.find_by_id(params[:id])
    
    if @article.update(params_article)
      flash[:notice] = "Success Update Records"
      redirect_to action: 'index'
    else
      flash[:error] = "data cannot update"
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find_by_id(params[:id])
    
    if @article.destroy
      flash[:notice] = "Success Delete a Article"
      redirect_to action: 'index'
    else
      flash[:error] = "Fails delete article"
      redirect_to action: 'index'
    end
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params_article)
    
    if @article.save
      flash[:notice] = "Success Add Records"
      
      redirect_to action: 'index'
    else
      flash[:errors] = "Data not valid"
      render "new"
    end
  end
  
  private
  def params_article
    params.require(:article).permit(:title, :content, :status, :photo)
  end
end
