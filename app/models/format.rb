class Format < ActiveHash::Base
  
  self.data = [
    { id: 1, name: '__' },
    { id: 2, name: '売却希望' },
    { id: 3, name: '共同制作' },
    { id: 4, name: 'コメントのみ希望' }
  ]

  include ActiveHash::Associations
  has_many :ideas

end