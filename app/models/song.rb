require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    #binding.pry
    #name = self.artist.name
    #name if !!name
    self.try(:artist).try(:name)
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre

  end

  def genre_name
    #name = self.genre.name
    #name if !!name
    self.try(:genre).try(:name)
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note) if note != ''
    end
  end

  def note_contents
    self.notes.map {|n| n.content}
  end
end
