require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "tokenがあれば登録できる" do
    expect(@order).to be_valid
  end

  it "tokenが空では登録できない" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end

  it "userが紐づいていないと登録できない" do
    @order.user = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("User must exist")
  end
  it "ideaが紐づいていないと登録できない" do
    @order.idea = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Idea must exist")
  end
  it "priceがからのとき" do
    @order.price = ""
    @order.valid?
    expect(@order.errors.full_messages)
  end
  it "priceに全角漢字が含まれているとき" do
    @order.price = "10000円"
    @order.valid?
    expect(@order.errors.full_messages).to include("Price is not a number")
  end
  it "priceに全角かなが含まれているとき" do
    @order.price = "1000えん"
    @order.valid?
    expect(@order.errors.full_messages).to include("Price is not a number")
  end
  it "priceに全角カナが含まれているとき" do
    @order.price = "1000エン"
    @order.valid?
    expect(@order.errors.full_messages).to include("Price is not a number")
  end
  it "priceに記号が含まれているとき" do
    @order.price = "¥10000"
    @order.valid?
    expect(@order.errors.full_messages).to include("Price is not a number")
  end
  it "priceが99以下のとき" do
    @order.price = 99
    @order.valid?
    expect(@order.errors.full_messages).to include("Price must be greater than or equal to 100")
  end
  it "priceが1000000より大きいとき" do
    @order.price = 1000001
    @order.valid?
    expect(@order.errors.full_messages).to include("Price must be less than or equal to 1000000")
  end
end
