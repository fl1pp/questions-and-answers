class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :questions
  has_many :answers
  has_many :corrections

  validates :password, length: { minimum: 3 }
	validates :password, confirmation: true
	validates :email, uniqueness: true
end
