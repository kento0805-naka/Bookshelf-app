class BooksController < ApplicationController
  def index
  end

  def show
  end

  
  def new
    @book = Book.new
    @books = []
    
    if params[:title].present?
      results = RakutenWebService::Books::Book.search(title: params[:title])
      
      results.each do |result|
        book = Book.find_or_initialize_by(read(result))
        @books << book
      end
      
    else
      flash[:danger] = 'キーワードを入力してください'
    end
  end
  
  def create
    
  end
  
  
  
 
  
  
  
end
