require "rails_helper"

RSpec.describe "StaticPages", type: :system do
  describe "root" do
    context "rootにアクセスした場合" do
      before do
        visit root_path
      end

      it "homeページが表示される" do
        expect(page).to have_content "Sample App"
      end
    end
  end

  describe "home" do
    context "homeにアクセスした場合" do
      before do
        visit static_pages_home_path
      end

      it "homeページが表示される" do
        expect(page).to have_content "Sample App"
      end

      it "設定したタイトルが表示される" do
        expect(page).to have_title "Home | Ruby on Rails Tutorial Sample App"
      end
    end
  end

  describe "help" do
    context "helpにアクセスした場合" do
      before do
        visit static_pages_help_path
      end

      it "helpページが表示される" do
        expect(page).to have_content "Help"
      end

      it "設定したタイトルが表示される" do
        expect(page).to have_title "Help | Ruby on Rails Tutorial Sample App"
      end
    end
  end

  describe "about" do
    context "aboutにアクセスした場合" do
      before do
        visit static_pages_about_path
      end

      it "aboutページが表示される" do
        expect(page).to have_content "About"
      end

      it "設定したタイトルが表示される" do
        expect(page).to have_title "About | Ruby on Rails Tutorial Sample App"
      end
    end
  end
end
