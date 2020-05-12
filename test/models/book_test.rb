# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  author     :string(255)
#  image_url  :string(255)
#  item_url   :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
