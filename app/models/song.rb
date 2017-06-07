class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end

  def note_contents
    self.notes.collect{|note| note.content}
  end

  def note_contents=(notes)
    notes = notes.reject {|a| a.empty?}
    notes.each do |content|
      some_note = Note.find_or_create_by(content: content)
      self.notes << some_note
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

end
