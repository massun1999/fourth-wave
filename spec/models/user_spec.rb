require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録ができる時' do
      it "全ての項目が正しく入力されている時" do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      it "nicknameが空のとき" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空のとき" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "すでに登録されているemailアドレスは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "abcd5"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordに半角数字が含まれていないと登録できない" do
        @user.password = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordに全角漢字が含まれると登録できない" do
        @user.password = "abcd2山"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordに全角かなが含まれると登録できない" do
        @user.password = "abcd1やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordに全角カナが含まれると登録できない" do
        @user.password = "abcd1ヤマダ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordに記号が含まれると登録できない" do
        @user.password = "abcde.1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが正しく入力されていてもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
        @user.password = "yamada628"
        @user.password_confirmation = "tanaka123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameに数字が含まれると登録できない" do
        @user.first_name = "やマ田1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "first_nameに半角英字が含まれると登録できない" do
        @user.first_name = "やマ田a"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameに数字が含まれると登録できない" do
        @user.last_name = "やマ田1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "last_nameに半角英字が含まれると登録できない" do
        @user.last_name = "やマ田a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_rubyが空だと登録できない" do
        @user.first_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First ruby can't be blank")
      end
      it "first_rubyに全角漢字が含まれると登録できない" do
        @user.first_ruby = "ヤマ田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First ruby is invalid")
      end
      it "first_nameに全角かなが含まれると登録できない" do
        @user.first_ruby = "やマダ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First ruby is invalid")
      end
      it "first_rubyに半角英字が含まれると登録できない" do
        @user.first_ruby = "yaマダ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First ruby is invalid")
      end
      it "first_rubyに数字が含まれると登録できない" do
        @user.first_ruby = "ヤマダ1"
        @user.valid?
        expect(@user.errors.full_messages).to include("First ruby is invalid")
      end
      it "first_rubyに記号が含まれると登録できない" do
        @user.first_ruby = "ヤマダ。"
        @user.valid?
        expect(@user.errors.full_messages).to include("First ruby is invalid")
      end
      it "last_rubyが空だと登録できない" do
        @user.last_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last ruby can't be blank")
      end
      it "last_rubyに全角漢字が含まれると登録できない" do
        @user.last_ruby = "ヤマ田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last ruby is invalid")
      end
      it "last_nameに全角かなが含まれると登録できない" do
        @user.last_ruby = "やマダ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last ruby is invalid")
      end
      it "last_rubyに半角英字が含まれると登録できない" do
        @user.last_ruby = "yaマダ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last ruby is invalid")
      end
      it "last_rubyに数字が含まれると登録できない" do
        @user.last_ruby = "ヤマダ1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last ruby is invalid")
      end
      it "last_rubyに記号が含まれると登録できない" do
        @user.last_ruby = "ヤマダ。"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last ruby is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
