class Unit < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'ml' },
    { id: 2, name: 'g' },
    { id: 3, name: '個' },
    { id: 4, name: '枚' }
  ]

  include ActiveHash::Associations
  has_many :items
end