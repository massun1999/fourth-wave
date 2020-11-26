class Profile < ApplicationRecord

 #仕様変更のため未使用
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :area
 #//仕様変更のため未使用

  belongs_to :user



end
