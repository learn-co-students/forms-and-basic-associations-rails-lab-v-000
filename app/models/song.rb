class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.pluck(:content)
  end

  def notes=(notes_arr)
    notes_arr.each do |note|
      new_note = Note.create(content: note)
      self.notes << new_note if new_note.valid?
    end
  end

end

