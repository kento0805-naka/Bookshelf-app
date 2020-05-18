class BooksController < ApplicationController
  def index
    @books = Book.all.order(id: 'desc').limit(20)
  end

  def show
    @book = Book.find(params[:id])
    @status_book = current_user.userbooks.find_by(book_id: @book.id)
  end

  
  def new
    @book = Book.new
    @books = []
    return unless params.key?(:title)
      
    if params[:title].present?
      results = RakutenWebService::Books::Book.search(title: params[:title])
      
      results.each do |result|
        book = Book.find_or_initialize_by(read(result))
        @books << book
     end
      
    else
      flash.now[:notice] = 'キーワードを入力してください'
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
    
    if book.persisted?
      book_data = Book.find_by(item_url: book.item_url)
      current_user.register_book(book_data)
      redirect_to user_path(current_user.id)
    else
      book.save
      current_user.register_book(book)
      redirect_to user_path(current_user.id)
    end

  end
  
  def update
    book = Book.find(params[:id])
    userbook = current_user.userbooks.find_by(book_id: book.id)
    
    if userbook.status == 1
      userbook.status = 2
      if userbook.save
        flash[:success] = 'ステータスを変更しました'
        redirect_back(fallback_location: root_path)
      else
        flash.now[:danger] = 'ステータス変更できませんでした'
        render :show
      end
    elsif userbook.status == 2
      userbook.status = 1
      userbook.save
      if userbook.save
        flash[:success] = 'ステータスを変更しました'
        redirect_back(fallback_location: root_path)
      else
        flash.now[:danger] = 'ステータス変更できませんでした'
        render :show
      end
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    userbook = current_user.userbooks.find_by(book_id: book.id)
    
    if userbook.delete
      flash[:success] = '本棚から削除しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '削除できませんでした'
      render :show
    end
  end
  
  def add
    book = Book.find(params[:id])
    if current_user.register_book(book)
      flash[:success] = '本棚に追加しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '本棚に追加できませんでした'
      render :show
    end
  end
 
  
  
  
end
