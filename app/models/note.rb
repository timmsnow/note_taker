class Note < ApplicationRecord
  belongs_to :user
  has_many :note_categories
  has_many :categories, through: :note_categories 

end
