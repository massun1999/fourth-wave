require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe '#idea' do
    before do
      @idea = FactoryBot.build(:idea)
    end

    context '新規投稿ができるとき' do
      it "全ての項目が正しく入力されていれば投稿できる" do
        expect(@idea).to be_valid
      end
    end

    context '新規投稿ができないとき' do
      it "titleが空のとき" do
        @idea.title = ""
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Title can't be blank")
      end
      it "textがからのとき" do
        @idea.text = ""
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Text can't be blank")
      end
      it "priceがからのとき" do
        @idea.price = ""
        @idea.valid?
        expect(@idea.errors.full_messages)
      end
      it "priceに全角漢字が含まれているとき" do
        @idea.price = "10000円"
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Price is not a number")
      end
      it "priceに全角かなが含まれているとき" do
        @idea.price = "1000えん"
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Price is not a number")
      end
      it "priceに全角カナが含まれているとき" do
        @idea.price = "1000エン"
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Price is not a number")
      end
      it "priceに記号が含まれているとき" do
        @idea.price = "¥10000"
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Price is not a number")
      end
      it "priceが0以下のとき" do
        @idea.price = 0
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Price must be greater than 0")
      end
      it "priceが1000000より大きいとき" do
        @idea.price = 1000001
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Price must be less than or equal to 1000000")
      end
      it "imageがからのとき" do
        @idea.image = nil
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Image can't be blank")
      end
      it "category_idがからのとき" do
        @idea.category_id = ""
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Category is not a number")
      end
      it "catagory_idが1のとき" do
        @idea.category_id = 1
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Category must be other than 1")
      end
      it "format_idが空のとき" do
        @idea.format_id = ""
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Format is not a number")
      end
      it "format_idが1のとき" do
        @idea.format_id = 1
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Format must be other than 1")
      end
    end
  end
end
