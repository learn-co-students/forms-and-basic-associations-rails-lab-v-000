class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
    self.save
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      unless content.strip == ''
        note = Note.find_or_create_by(content: content)
        self.notes << note
      end
    end
    self.save
  end

  def note_contents
    contents = []
    unless self.notes == []
      self.notes.each {|note| contents << note.content }
    end
    contents
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
    self.save
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

end
