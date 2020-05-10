class BooksController < ApplicationController
  def index
  end

  def show
  end

  def search
    if params[:keyword].present?
     @books = RakutenWebService::Books::Book.search(title: params[:keyword])
    else
      flash[:danger] = 'キーワードを入力してください'
      
    end
  end
end
