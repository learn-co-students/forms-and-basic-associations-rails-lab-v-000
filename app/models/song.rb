class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :song_genre_id, :song_artist_name, :note_contents

  def song_artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def song_genre_id=(id)
    self.genre = Genre.find(id)
  end

  def note_contents=(note_contents)
    note_contents.each do |content|
      self.notes << Note.find_or_create_by(content)
    end
  end

end
