class NoteCategoriesController < ApplicationController

  def create
    note_category = NoteCategory.new(
      note_id: params[:note_id],
      category_id: params[:category_id],
    )
    if note_category.save
      render json: note_category
    else
      render json: { errors: note_category.errors.full_messages }
    end
  end

  def destroy
    note_category_id = params[:id]
    note_category = NoteCategory.find(note_category_id)
    note_category.destroy

    render json: { message: "note_category successfully deleted" }
  end

end
