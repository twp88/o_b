class FrontPageController < ApplicationController
  def index
    @articles = Article.all
  end
end
