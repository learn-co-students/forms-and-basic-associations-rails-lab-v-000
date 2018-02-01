class Song < ActiveRecord::Base

  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_accessor :artist_name, :genre_name

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name unless !self.artist
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name unless !self.genre
  end

  def note_contents=(contents)
     contents.each do |content|
       note = Note.find_or_create_by(content: content)
       self.notes << note
     end
     self.notes
  end

  def note_contents
    self.notes.map { |note| note.content }.select(&:present?)
  end

end
