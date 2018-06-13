class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(notes_array)
    notes_array.each do |n|
      note = Note.find_or_create_by(content: n)
      self.notes << note
    end
  end

  def note_contents
    contents = self.notes.collect { |n| n.content }
    contents.delete_if{|n| n == ""}
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end
end
