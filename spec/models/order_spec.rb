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
end
