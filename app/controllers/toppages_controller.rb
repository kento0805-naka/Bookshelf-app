class ToppagesController < ApplicationController
  def index
    @users = User.all.order(id: 'desc').limit(4)
    @books = Book.all.order(id: 'desc').limit(4)
  end
end
