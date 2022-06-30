require "rails_helper"

RSpec.describe "StaticPages", type: :system do
  describe "home" do
    context "homeにアクセスした場合" do
      it "homeページが表示される" do
        visit static_pages_home_path
        expect(page).to have_content "Sample App"
        expect(page).to have_title "Home | Ruby on Rails Tutorial Sample App"
      end
    end
  end

  describe "help" do
    context "helpにアクセスした場合" do
      it "helpページが表示される" do
        visit static_pages_help_path
        expect(page).to have_content "Help"
        expect(page).to have_title "Help | Ruby on Rails Tutorial Sample App"
      end
    end
  end

  describe "about" do
    context "aboutにアクセスした場合" do
      it "aboutページが表示される" do
        visit static_pages_about_path
        expect(page).to have_content "About"
        expect(page).to have_title "About | Ruby on Rails Tutorial Sample App"
      end
    end
  end
end
