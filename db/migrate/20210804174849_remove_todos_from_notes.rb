class RemoveTodosFromNotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :notes, :todos

  end
end
