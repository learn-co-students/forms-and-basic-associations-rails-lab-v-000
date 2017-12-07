require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    self.genre.name
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def note_contents=(notes)
    notes.each do |note|
      if !note.empty?
        self.notes << Note.find_or_create_by(content: note)
      end
    end
  end
end
