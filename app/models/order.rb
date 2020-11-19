class Order < ApplicationRecord
  attr_accessor :token

  with_options presence: true do
    validates :token
    validates :price, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 1000000 }
  end

  belongs_to :user
  belongs_to :idea

end
