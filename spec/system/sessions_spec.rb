require "rails_helper"

RSpec.describe "sessions", type: :system do
  describe "login" do
    let!(:user) { create(:user) }

    before do
      visit login_path
      fill_in "session_email", with: user_params.email
      fill_in "session_password", with: user_params.password
      click_on "commit"
    end

    context "不正な入力でログインしようとした場合" do
      let(:user_params) { build(:user, email: "a@a", password: "  ") }

      it "ログインできない" do
        expect(page).to have_selector ".alert-danger", text: "Invalid email/password combination"
      end

      it "他のページに移動するとフラッシュは消える" do
        click_on "sample app"
        sleep 0.2
        expect(page).not_to have_css ".alert-danger"
      end
    end

    context "存在するuser情報でログインしようとした場合" do
      let(:user_params) { build(:user) }

      it "userのshowページが表示される" do
        expect(page).to have_current_path user_path(user)
        expect(page).to have_content user.name
      end

      it "ページにはログイン後のリンクが表示される" do
        click_on I18n.t("views.header.users")
        expect(page).to have_link I18n.t("views.header.settings"), href: "#"
        expect(page).to have_link I18n.t("views.header.log_out"), href: logout_path
        expect(page).to have_link I18n.t("views.header.profile"), href: user_path(user)
      end

      it "ページにはログインのリンクは表示されない" do
        click_on I18n.t("views.header.users")
        expect(page).not_to have_link I18n.t("views.header.log_in"), href: login_path
      end
    end
  end

  describe "logout" do
    let!(:user) { create(:user) }

    before do
      visit login_path
      fill_in "session_email", with: user_params.email
      fill_in "session_password", with: user_params.password
      click_on "commit"
      sleep 0.2
      click_on I18n.t("views.header.users")
      click_on I18n.t("views.header.log_out")
    end

    context "ログアウトをクリックした場合" do
      let(:user_params) { build(:user) }

      it "ルートページが表示される" do
        expect(page).to have_current_path root_path
        expect(page).to have_content "Welcom to the Sample App"
      end

      it "ログインのリンクが表示される" do
        expect(page).to have_link I18n.t("views.header.log_in"), href: login_path
      end

      it "ログイン時に表示されるリンクは表示されない" do
        expect(page).not_to have_link I18n.t("views.header.users"), href: "#"
        expect(page).not_to have_link I18n.t("views.header.settings"), href: "#"
        expect(page).not_to have_link I18n.t("views.header.log_out"), href: logout_path
        expect(page).not_to have_link I18n.t("views.header.profile"), href: user_path(user)
      end
    end
  end
end
