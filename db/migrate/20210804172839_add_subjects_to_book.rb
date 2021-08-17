class AddSubjectsToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :todos, :text, array: true, default: []
  end
end
