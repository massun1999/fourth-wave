class Category < ActiveHash::Base

  self.data = [
    { id: 1, name: '__' },
    { id: 2, name: 'テクノロジー'},
    { id: 3, name: '生活雑貨'},
    { id: 4, name: '飲食店'},
    { id: 5, name: 'イベント'},
    { id: 6, name: 'その他'}
  ]
  include ActiveHash::Associations
  has_many :ideas

end