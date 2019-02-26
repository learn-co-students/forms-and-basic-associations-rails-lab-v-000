class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(genre_id)
    # byebug
    self.genre = Genre.find_or_create_by(id: genre_id)
  end

  def genre_name
    # byebug
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
    byebug
    notes.each do |note|
      note = Note.create(note)
      self.notes << note
    end
  end

  def note_contents
    self.notes ? self.notes : nil
  end
end
