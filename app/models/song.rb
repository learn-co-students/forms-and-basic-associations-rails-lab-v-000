class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def song_notes=(notes)
    notes.each do |note|
      Note.create(content: note, song_id: self.id)
    end
  end

  def note_contents
    content = []
    self.notes.each do |note|
      content << note.content
    end
  end

end

