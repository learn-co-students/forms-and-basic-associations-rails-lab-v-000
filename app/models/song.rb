class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist 
  end 

  # try returns nil instead of raising an exception if receiver does not respond to the method
  def artist_name
    self.try(:artist).try(:name)
  end 

  def note_contents=(notes)
    notes.each do |content| 
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

# & passes content as a block to the map method 
  def note_contents
    self.notes.map(&:content)
  end

end

