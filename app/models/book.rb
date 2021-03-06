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
class Book < ApplicationRecord
    has_many :users, through: :userbook, source: :user
    has_many :userbooks
end
