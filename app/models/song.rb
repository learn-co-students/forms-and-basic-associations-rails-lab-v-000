class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    # fascinating - you MUST use self or this code will
    # fail in real-world scenarios; I tried without self
    # and it failed miserably
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    # fascinating - you MUST use self or this code will
    # fail in real-world scenarios; I tried without self
    # and it failed miserably
    self.artist ? self.artist.name : nil
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(note_contents)
    note_contents.each do |content|
      note = Note.create(content: content, song_id: self.id)
      self.notes << note
    end
  end

end
