require "rails_helper"

RSpec.describe :static_pages, type: :system do
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
        visit home_path
      end

      it "homeページが表示される" do
        expect(page).to have_content "Sample App"
      end

      it "設定したタイトルが表示される" do
        expect(page).to have_title full_title
        expect(page).not_to have_title "Home"
      end
    end
  end

  describe "help" do
    context "helpにアクセスした場合" do
      before do
        visit help_path
      end

      it "helpページが表示される" do
        expect(page).to have_content "Help"
      end

      it "設定したタイトルが表示される" do
        expect(page).to have_title full_title("Help")
      end
    end
  end

  describe "about" do
    context "aboutにアクセスした場合" do
      before do
        visit about_path
      end

      it "aboutページが表示される" do
        expect(page).to have_content "About"
      end

      it "設定したタイトルが表示される" do
        expect(page).to have_title full_title("About")
      end
    end
  end

  describe "contact" do
    context "contactにアクセスした場合" do
      before do
        visit contact_path
      end

      it "aboutページが表示される" do
        expect(page).to have_content "Contact"
      end

      it "設定したタイトルが表示される" do
        expect(page).to have_title full_title("Contact")
      end
    end
  end

  describe "layout links" do
    before do
      visit root_path
    end
    context "ルートパスにアクセスした場合" do
      it "ルートのリンクがある" do
        expect(page).to have_link "sample app", href: root_path
      end
      it "Homeのリンクがある" do
        expect(page).to have_link "Home", href: home_path
      end
      it "Helpのリンクがある" do
        expect(page).to have_link "Help", href: help_path
      end
      it "Aboutのリンクがある" do
        expect(page).to have_link "About", href: about_path
      end
      it "Contactのリンクがある" do
        expect(page).to have_link "Contact", href: contact_path
      end
    end
  end
end
