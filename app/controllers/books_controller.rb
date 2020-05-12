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
    @title = params[:book][:title]
    @author = params[:book][:author]
    @image_url = params[:book][:image_url]
    @item_url = params[:book][:item_url]
    
    book = Book.find_or_initialize_by({
      title: @title,
      author: @author,
      image_url: @image_url,
      item_url: @item_url
    })
    
    unless book.persisted?
      book.save
      current_user.register_book(book)
      redirect_to root_path
    else
      flash[:danger] = "本棚に追加できませんでした"
    end
    
    
    
  end
  
  
  
 
  
  
  
end
