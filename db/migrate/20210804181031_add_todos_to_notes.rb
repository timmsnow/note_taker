class AddTodosToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :todos, :jsonb, default: {}

  end
end
