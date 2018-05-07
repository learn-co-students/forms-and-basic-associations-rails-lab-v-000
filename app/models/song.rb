class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

#we are building the custom setter method that allows songs to have many notes
#take each id and find that note object and push into the song.notes collection
  def note_contents=(contents)
    contents.each do |content|
      note = Note.find_by(content: content)
      if note
        self.notes << note
      end
    end
  end

  def note_contents
    @self.notes
  end

#we have a custom setter to assign an artist object to the song. It finds the artist object by name.
  def artist_name=(name)
    self.artist=Artist.find_or_create_by(name: name)
  end

#we have a custom reader method to read the song's artists name.
  def artist_name
    if self.artist
      self.artist.name
    end
  end

 end
