class Idea < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :format

  belongs_to :user
  has_one_attached :image
  has_many :orders
  has_many :comments


  with_options presence: true do
    validates :title, length: { maximum: 40}
    validates :text
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
  end

  def self.search(search)
    if search != ""
      Idea.where('title LIKE(?)', "%#{search}%" ).where('text LIKE(?)',"%#{search}%" )
    else
      Idea.all
    end
  end

  def self.set_idea(comment)
    Idea.where("id = #{comment.idea_id}").pluck(:user_id)
  end





end
