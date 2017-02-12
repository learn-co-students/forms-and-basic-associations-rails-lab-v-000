require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
   if artist
    artist.name
   end
  end

  def note_contents=(array)
    array.collect do |e|
     if e != ""
      self.notes.build(:content => e)
     end
    end
  end

  def note_contents
    notes.collect do |note|
      note.content
    end
  end

  def genre_name=(name)
   self.genre = Genre.find_by(name: name)
  end

  def genre_name
   genre.name
  end


end
