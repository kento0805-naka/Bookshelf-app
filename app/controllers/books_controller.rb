class BooksController < ApplicationController
  def index
  end

  def show
  end

  def search
    if params[:keyword]
     @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    end
  end
end
