class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '化粧水' },
    { id: 2, name: '美容液' },
    { id: 3, name: '乳液' },
    { id: 4, name: 'クレンジング' },
    { id: 5, name: '洗顔料' },
    { id: 6, name: 'パック' }
  ]

  include ActiveHash::Associations
  has_many :items
end