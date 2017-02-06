require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(gname)
    self.genre = Genre.find_or_create_by(name: gname)
    self.save
  end

  def genre_name
    if self.genre
      self.genre.name
    else
      nil
    end
  end

  def artist_name=(aname)
    self.artist = Artist.find_or_create_by(name: aname)
    self.save
  end

  def artist_name
    if self.artist
      self.artist.name
    else
      nil
    end
  end

  def note_contents=(words)
    words.each do |word|
      if word != ""
        self.notes << Note.find_or_create_by(content: word)
      end
    end
    self.save
  end

  def note_contents
    contents = []
    self.notes.each do |note|
      contents << note.content
    end
    contents
  end
end
