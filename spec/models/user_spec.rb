require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前とメールアドレスとパスワードがあれば登録できる" do
  
    user = User.new(
      id: 1,
      name: 'kento',
      email: 'example@gmail.com',
      password: 'password',
      created_at: '2020-05-12 11:35:55',
      updated_at: '2020-05-12 11:35:55'
      )
    
    expect(user).to be_valid
  end
end
