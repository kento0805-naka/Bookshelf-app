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
require 'test_helper'

class UserbookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
