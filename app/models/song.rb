class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist
  end
  
  def note_contents
    @note_contents = []
    self.notes.each do |note|
      @note_contents << note.content
    end
    @note_contents
  end
  
  def note_contents=(notes)
    notes.each_with_index do |n, i|
      note = Note.create(content: notes[i])
      self.notes << note
    end
  end

end

