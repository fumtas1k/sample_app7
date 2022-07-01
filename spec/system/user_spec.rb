require "rails_helper"

RSpec.describe :user, type: :system do
  describe "signup" do
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
end
