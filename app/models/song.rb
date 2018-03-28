require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(input)
    self.genre = Genre.find_by(name: input)
  end

  def genre_name
    self.genre.name if self.genre
  end

  def artist_name=(input)
    self.artist = Artist.find_or_create_by(name: input)
  end

  def artist_name
    self.artist.name if self.artist
  end

  def notes_1=(input)
    self.notes << Note.new(content: input)
  end

  def notes_1
    self.notes.first.content if self.notes.first
  end

  def notes_2=(input)
    self.notes << Note.new(content: input)
  end

  def notes_2
    self.notes[1].content if self.notes[1]
  end

  def note_contents=(arr)
    arr.each {|note| self.notes << Note.new(content: note) unless note.blank?}
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

end
