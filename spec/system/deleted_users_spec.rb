require 'rails_helper'
require 'date'

describe 'セッション機能', type: :system do
  let(:deleted_user) { FactoryBot.create(:deleted_user, username: 'deleted_user', email: 'example@deleted.com', deleted_at: DateTime.now - 1) }
  
  describe 'ログイン機能' do
    before do
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end
      
    context '削除済みユーザーがログインしようとしたとき' do
      let(:login_user) { deleted_user }

      it 'ログイン出来ずにメッセージが表示される' do
        expect(current_path).to eq('/user/sign_in')
        expect(page).to have_text('このユーザーは削除済みです')
      end
    end
  end
end
    