class Unit < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ml' },
    { id: 3, name: 'g' }
  ]
  
  include ActiveHash::Associations
  has_many :items
end