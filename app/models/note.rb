class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song

  def song_title=(title)
    self.song = Song.find_or_create_by(title: title)
  end

  def song_title
    self.song ? self.song.name : nil
  end
end
