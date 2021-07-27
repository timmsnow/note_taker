class Category < ApplicationRecord
  belongs_to :user
  has_many :note_categories
  has_many :notes, through: :note_categories
end
