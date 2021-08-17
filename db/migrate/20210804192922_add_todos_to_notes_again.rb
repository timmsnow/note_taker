class AddTodosToNotesAgain < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :todos, :string, array:true, default: []
  end
end
