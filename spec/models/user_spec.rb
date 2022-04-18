require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Example User', email: 'user@example.com') }

  it 'userが有効であること' do
    expect(user).to be_valid
  end

  it 'nameが必須であること' do
    user.name =''
    expect(user).to_not be_valid 
  end

  it 'emailが必須であること' do
    user.email =''
    expect(user).to_not be_valid 
  end

  it 'ユーザー名が50文字以内であること' do
    user.name = 'a' * 51
    expect(user).to_not be_valid 
  end

  it 'emailが255文字以内であること' do
    user.email = "#{a * 244}@example.com"
    expect(user).to_not be_valid 
  end
end
