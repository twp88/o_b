class FrontPageController < ApplicationController
  def index
    @articles = Article.all
    @about_me = about_me
  end

  protected

  def about_me
    "My name is Tom. I like to read and write, climb things, think about stuff
    and drink coffee. From time to time I also like to code bits and pieces.
    These are my cronicalled coding adventures. You might found some of this
    stuff fairly inconsequential or uninteresting. That's because this is as
    much for me, the writer, as it is for you the reader. As Martin Fowler says
    'The best way that I can learn something is by writing an article about it.'
    Enjoy!"
  end
end
