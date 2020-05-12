class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def register_book(book)
    self.userbooks.find_or_create_by(book_id: book.id)
  end
end
