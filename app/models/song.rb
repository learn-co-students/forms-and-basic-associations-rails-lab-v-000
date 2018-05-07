class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

#we are building the custom setter method that allows songs to have many notes
#take each id and find that note object and push into the song.notes collection
  def note_contents=(notes)
    notes.each do |content|
      self.notes.build(content: content) if !content.empty?
    end
  end

#map invokes the given block once for each element of self. so self has multiple
#note elements. it calls .content on each and puts the values returned by the
#block in a new array.

  def note_contents
    @self.notes.map(&:content)
  end

#we have a custom setter to assign an artist object to the song. It finds the artist object by name.
  def artist_name=(name)
    self.artist=Artist.find_or_create_by(name: name)
    self.artist = artist
  end

#we have a custom reader method to read the song's artists name.
  def artist_name
    if self.artist
      self.artist.name
    end
  end

#we have a custom setter to assign an artist object to the song. It finds the artist object by name.
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

#we have a custom reader method to read the song's artists name.
  def genre_name
    if self.genre.name
      self.genre.name
    end
  end


 end
