class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  attr_accessor :notes_1
  attr_accessor :notes_2
  
  def genre_name
    if genre==nil then
      ""
    else 
      genre.name
    end
  end

  def genre_name= n
    self.genre = Genre.find_or_create_by(name: n)
  end

  def artist_name
    if artist==nil then
      ""
    else
      artist.name
    end
  end

  def artist_name= n
    self.artist = Artist.find_or_create_by(name: n)
  end

  def note_contents
    self.notes.map{|n| n.content }
  end

  def note_contents= a
    a.each{|c| if c!=nil and c.length>0
      n=Note.find_or_create_by(content: c, song: self)
      if self.notes.include?(n)!=true then self.notes<<n end
    end}
  end
  
end

