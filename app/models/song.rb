require 'pry'
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

  def genre_name
    self.genre.name if self.genre
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name:genre)
  end

  def note_contents
    self.notes.collect{ |note| note.content if !note.content.empty?}
  end

def note_contents=(notes_array)

  notes_array.each do |note|
    self.notes << Note.find_or_create_by(content: note) if note != ""
  end
end
end
