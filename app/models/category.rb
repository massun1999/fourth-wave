class Category < ActiveHash::Base

  self.data = [
    { id: 1, name: '__' },
    { id: 2, name: 'PourOver'},
    { id: 3, name: 'Espresso'},
    { id: 4, name: 'AeroPress'},
    { id: 5, name: 'FrenchPress'},
    { id: 6, name: 'その他'}
  ]
  include ActiveHash::Associations
  has_many :ideas

end