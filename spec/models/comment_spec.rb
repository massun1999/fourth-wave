require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#comment' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it 'textがあればコメントできる' do
      expect(@comment).to be_valid
    end

    it 'textが空だと投稿できない' do
      @comment.text = ""
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Text can't be blank")
    end

    it 'userが紐づいていないと投稿できない' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("User must exist")
    end

    it 'ideaが紐づいていないと投稿できない' do
      @comment.idea = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Idea must exist")
    end
  end
end
