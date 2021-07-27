class NoteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :content, :resolution_date

  belongs_to :user
  has_many :note_categories
  has_many :categories, through: :note_categories 
end
