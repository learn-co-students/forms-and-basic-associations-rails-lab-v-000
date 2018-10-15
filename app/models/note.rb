class Note < ActiveRecord::Base
  belongs_to :song

  def create
    Note.create(note_params)
  end

  def note_params
    params.require(:note).permit(:content, note_contents: [])
  end
end
