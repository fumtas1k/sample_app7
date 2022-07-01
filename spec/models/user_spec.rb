require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    let(:user) { build(:user) }

    shared_examples "invalid" do
      it "バリデーションに引っかかる" do
        expect(user).not_to be_valid
      end
    end

    context "全ての情報を入力した場合" do
      it "バリデーションが通る" do
        expect(user).to be_valid
      end
    end

    context "名前を入力しなかった場合" do
      before do
        user.name = ""
      end

      it_behaves_like "invalid"
    end

    context "emalを入力しなかった場合" do
      before do
        user.email = "       "
      end

      it_behaves_like "invalid"
    end

    context "名前が長すぎる場合" do
      before do
        user.name = "a" * 51
      end

      it_behaves_like "invalid"
    end

    context "emailが長すぎる場合" do
      before do
        user.email = "#{'a' * 244}@example.com"
      end

      it_behaves_like "invalid"
    end

    context "emailが正しいアドレスの場合" do
      let(:valid_addresses) { %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn] }

      it "バリデーションが通る" do
        valid_addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end
    end

    context "emailが不正なアドレスの場合" do
      let(:invalid_addresses) { %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com] }

      it "バリデーションに引っかかる" do
        invalid_addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).not_to be_valid
        end
      end
    end

    context "emailアドレスが重複している場合" do
      let(:duplicate_user) { build(:user) }

      before do
        duplicate_user.email.upcase!
        duplicate_user.save
      end

      it_behaves_like "invalid"
    end

    context "passwordが空文字の場合" do
      before do
        user.password = " " * 6
      end

      it_behaves_like "invalid"
    end

    context "passwordが6文字未満の場合" do
      before do
        user.password = "a" * 5
      end

      it_behaves_like "invalid"
    end
  end
end
