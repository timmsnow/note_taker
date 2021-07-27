class User < ApplicationRecord
  has_many :notes
  has_many :categories

  has_secure_password
  validates :email, presence: true, uniqueness: true

end
