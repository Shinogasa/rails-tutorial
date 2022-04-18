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
    user.email = "#{'a' * 244}@example.com"
    expect(user).to_not be_valid 
  end

  it 'メアドが有効であること' do
    valid_addresses = %w[user@exmple.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid 
    end
  end

  it '無効な形式のメアドは制限されること' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).to_not be_valid 
    end
  end

  it 'emailは重複できないこと' do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user).to_not be_valid 
  end

  it 'emailは小文字で保存されること' do
    mixed_case_email = "Foo@ExAMPle.CoM"
    user.email = mixed_case_email
    user.save
    expect(user.reload.email).to eq mixed_case_email.downcase
  end
end
