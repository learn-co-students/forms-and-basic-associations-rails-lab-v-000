class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
    notes.each do |note|
      new_note = Note.create(content: note)
      self.notes << new_note if new_note.save
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end
end
