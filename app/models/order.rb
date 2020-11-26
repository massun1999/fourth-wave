class Order < ApplicationRecord
  attr_accessor :token

  with_options presence: true do
    validates :token
    validates :price, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 1000000 }
  end

  belongs_to :user
  belongs_to :idea

  def self.tip(idea_id)
    @tip = Order.where("idea_id = #{idea_id}").pluck(:price)
    tip_total = 0
    @tip.each do |t|
       tip_total += t
    end
    return tip_total
  end

end
