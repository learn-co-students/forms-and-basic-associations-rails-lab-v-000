class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def song_genre_id
    self.genre ? self.genre.id : nil
  end

  def song_genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_ids=(ids)
    ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end

  def note_contents
    contents = []
    self.notes.each do |note|
      contents << note.content
    end
    contents
  end

  def note_contents=(n_contents)
    n_contents.each do |n|
      if !n.blank?
        note = Note.find_or_create_by(content: n)
        self.notes << note
      end
    end
  end
end
