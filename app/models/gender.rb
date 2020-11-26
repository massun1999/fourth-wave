class Gender < ActiveHash::Base
  #未使用
  self.data = [
    { id: 1, name: '__' },
    { id: 2, name: '男性'},
    { id: 3, name: '女性'},
  ]
  include ActiveHash::Associations
  has_many :profiles

end