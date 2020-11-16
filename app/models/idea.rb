class Idea < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :format

  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :title, length: { maximum: 40}
    validates :text
    validates :price, numericality: {:less_than => 1000001}, numericality: {:greater_than => 1}
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :format_id
  end

end
