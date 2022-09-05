class User < ApplicationRecord
   has_many :posts
    validates :name, presence: true
    validates :email, uniqueness: true, presence: true
    validates :age, numericality: true
    validates :introduction, length: { in: 10..30 }
  end