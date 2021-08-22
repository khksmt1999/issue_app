require 'rails_helper'

describe '意見管理機能', type: :system do
  describe '編集機能' do
    let(:user_a) { FactoryBot.create(:user, username: 'ユーザーA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, username: 'ユーザーB', email: 'b@example.com') }
    let(:issue_by_a) { FactoryBot.create(:issue, title: 'issue_by_a', user: user_a) }
    let(:issue_by_b) { FactoryBot.create(:issue, title: 'issue_by_b', user: user_b) }

    before do
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it 'ユーザーAが作成した意見の編集画面に遷移できる' do
        visit edit_issue_path(issue_by_a.id)
        expect(current_path).to eq('/issues/' + issue_by_a.id.to_s + '/edit')
      end
      
      it 'ユーザーBが作成した意見の編集画面に遷移できない' do
        visit edit_issue_path(issue_by_b.id)
        expect(current_path).to eq('/issues')
        expect(page).to have_text '他者の意見を変更することはできません'
      end
    end
  end
end