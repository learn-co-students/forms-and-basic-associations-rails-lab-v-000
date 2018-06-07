class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents
    self.notes.map{|note| note.content}
  end

  def note_contents=(notes=[])
    notes.each do |note_content|
      note = Note.find_or_create_by(content: note_content)
      self.notes << note unless note_content.empty?
    end
  end

end
