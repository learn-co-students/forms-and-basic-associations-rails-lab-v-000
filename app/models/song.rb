class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # Returns artist name if the song already has an artist
  def artist_name
    self.artist.name if self.artist
  end

  # sets the song's artist to either a new artist or an existing one
  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  # Returns genre name if the song already has a genre
  def genre_name
    self.genre.name if self.genre
  end

  # sets the song's genre to either a new genre or an existing genre
  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  # adds notes to the song's notes
  def note_contents=(notes)
    notes.each do |note_content|
      if note_content != "" && note_content != " "
        note = Note.create(content: note_content)
        self.notes << note
      end
    end
  end

  # returns the content of a song's notes
  def note_contents
    self.notes.collect(&:content)
  end
end

