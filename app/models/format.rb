class Format < ActiveHash::Base
  
  self.data = [
    { id: 1, name: '__' },
    { id: 2, name: 'Recipe' },
    { id: 3, name: 'Method' },
    { id: 4, name: 'コメントのみ希望' }
  ]

  include ActiveHash::Associations
  has_many :ideas

end