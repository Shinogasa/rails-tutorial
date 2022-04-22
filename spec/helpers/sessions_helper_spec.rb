require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  describe '永続的セッションのテスト' do
    before do
      @user = FactoryBot.create(:user)
      remember(@user)
    end 

    context 'sessionがnilであるとき' do
      it 'current_userで正しいユーザーが返されること' do
        expect(current_user).to eq @user
      end
    end

    context 'digestが変なとき' do
      it 'current_userでnilが返されること' do
        @user.update_attribute(:remember_digest, User.digest(User.new_token))
        expect(current_user).to be_blank
      end
    end
  end
end
