class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :password_confirmation, :password_digest

  has_many :notes
  has_many :categories
end
