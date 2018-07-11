class Note < ActiveRecord::Base
  belongs_to :song


  private

  def note_params
    params.require(:note).permit(:content, :song_id)
  end
end
