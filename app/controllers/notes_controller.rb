class NotesController < ApplicationController
  def index
    @notes = Note.all
    # render json: notes
  end

  def show
    note_id = params[:id]
    @note = Note.find(note_id)
    # render json: note
  end

  def create
    note = Note.new(
      title: params[:title],
      content: params[:content],
      resolution_date: params[:resolution_date],
      user_id: current_user.id,
    )
    if current_user
      if note.save
        render json: note
      else
        render json: { errors: note.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {}, status: :unauthorized
    end
  end

  def update
    note_id = params[:id]
    note = Note.find(note_id)

    note.title = params[:title] || note.title
    note.content = params[:content] || note.content
    note.resolution_date = params[:resolution_date] || note.resolution_date

    if note.save
      render json: note
    else
      render json: { errors: note.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    note_id = params[:id]
    note = Note.find(note_id)
    note.destroy
    redirect_to notes_url

    # render json: { message: "note successfully deleted" }
  end
end
