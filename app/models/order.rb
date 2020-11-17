class Order < ApplicationRecord
  attr_accessor :token

  with_options presence: true do
    validates :token
  end

  belongs_to :user
  belongs_to :idea

end
