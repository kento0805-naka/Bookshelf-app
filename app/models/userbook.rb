# == Schema Information
#
# Table name: userbooks
#
#  id         :bigint           not null, primary key
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_userbooks_on_book_id  (book_id)
#  index_userbooks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (user_id => users.id)
#
class Userbook < ApplicationRecord
  before_create :set_default_status
  
  belongs_to :user
  belongs_to :book
  
  def set_default_status
    self.status = 1
  end
  
end
