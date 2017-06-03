class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
      artist.name if artist
  end

  def artist_name=(name)
      self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
      genre.name if genre
  end

  def genre_name=(name)
      self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents
      notes.collect { |note| note.content }
  end

  def note_contents=(note_contents)
      note_contents.each do |content|
          notes << Note.find_or_create_by(content: content) if content && !content.empty?
      end
  end
end
