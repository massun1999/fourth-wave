class Idea < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :format


  with_options presence: true do
    validates :title
    validates :copy
    validates :text
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :format_id
  end

end
