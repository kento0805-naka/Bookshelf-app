class RankingsController < ApplicationController
  def index
    @books_rank = Book.find(Userbook.group(:book_id).order('count(book_id) desc').limit(10).pluck(:book_id))
  end
end
