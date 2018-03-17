class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist.name unless self.artist.nil?
  end

  def notes=(notes)
    notes.each.with_index(1) do |content, id|
      note = Note.find_or_create_by(id: id)
      note.content = content
      self.notes << note
    end
  end

  def note_contents
    notes.collect { |note| note.content }
  end
end

