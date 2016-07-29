class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # sets the artist to the artist of the specified name
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  # returns the artist name
  def artist_name
    self.try(:artist).try(:name)
  end

  # sets the genre to the genre of the specified name
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  # returns the genre name
  def genre_name
    self.try(:genre).try(:name)
  end

  # sets notes for a song
  # adds to existing notes
  def note_contents=(notes)
    notes.each do |content|
      if content.strip != '' # => ignores blank notes
        self.notes.build(content: content) 
      end
    end
  end

  # returns the content of all notes as an array
  def note_contents
    self.notes.map(&:content)
  end

end
