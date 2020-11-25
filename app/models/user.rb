class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
           validates :nickname
           validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}, on: :registration
           validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}, on: :registration
           validates :first_ruby, format: { with: /\A[ァ-ヶー－]+\z/ }, on: :registration
           validates :last_ruby, format: { with: /\A[ァ-ヶー－]+\z/ }, on: :registration
           validates :birthday
         end
         validates :email, uniqueness: true
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: PASSWORD_REGEX },on: :registration, on: :session

         has_many :ideas, dependent: :destroy
         has_many :orders
         has_one :profile, dependent: :destroy
         has_many :comments
         has_many :entries, dependent: :destroy
         has_many :messages, dependent: :destroy
         accepts_nested_attributes_for :profile

         acts_as_followable 
         acts_as_follower
         
end
