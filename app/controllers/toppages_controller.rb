class ToppagesController < ApplicationController
  def index
    @users = User.all.order(id: 'desc').limit(4)
    @books = Book.all.order(id: 'desc').limit(4)
    @books_rank = Book.find(Userbook.group(:book_id).order('count(book_id) desc').limit(4).pluck(:book_id))
  end
end
