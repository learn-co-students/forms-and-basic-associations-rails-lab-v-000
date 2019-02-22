class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song

  def song_name=(name)
    self.song = Song.find_or_create_by(title: title)
  end

  def song_name
    self.song ? self.song.title : nil
  end


  private

    def note_params
      params.require(:note).permit(:content, :song_id)
    end

end
