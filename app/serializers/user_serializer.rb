class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password

  has_many :notes
  has_many :categories
end
