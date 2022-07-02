require "rails_helper"

RSpec.describe "user", type: :system do
  describe "signup表示" do
    before do
      visit signup_path
    end

    context "signupページにアクセスした場合" do
      it "signupページが表示される" do
        expect(page).to have_content "Sign up"
      end

      it "設定したタイトルが表示される" do
        expect(page).to have_title full_title("Sign up")
      end
    end
  end

  describe "signup入力" do
    before do
      visit signup_path
      fill_in "user_name", with: user.name
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      fill_in "user_password_confirmation", with: user.password_confirmation
    end

    context "不正な入力をした場合" do
      let(:user) { build(:user, name: " ", email: "user@invalid", password: "foo", password_confirmation: "bar") }

      it "エラーメッセージが表示され登録されない" do
        expect do
          click_on "commit"
          expect(page).to have_css "#error_explanation"
          expect(page).to have_content I18n.t("errors.messages.blank")
          expect(page).to have_content I18n.t("errors.messages.invalid")
          expect(page).to have_content I18n.t("errors.messages.too_short", count: 6)
          expect(page).to have_content I18n.t("errors.messages.confirmation", attribute: User.human_attribute_name(:password))
        end.not_to change(User, :count)
      end
    end

    context "正しい入力をした場合" do
      let(:user) { build(:user) }

      it "登録され、showページにリダイレクトする" do
        expect do
          click_on "commit"
          sleep 0.2
          expect(page).to have_current_path user_path(User.find_by(email: user.email))
          find ".alert", text: "Welcome to the Sample App!"
        end.to change(User, :count).by(1)
      end
    end
  end
end
