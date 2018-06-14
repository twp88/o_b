class ArticleController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :act_text)
  end
end
