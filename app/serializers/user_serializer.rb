class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :notes
  has_many :categories
end
