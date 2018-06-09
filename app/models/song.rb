class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    genre ? genre.name : nil
  end

  def genre_name= (genre_name)
    self.genre = Genre.find_by(name: genre_name)
  end

  def artist_name= (artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def note_contents= (contents)
    contents.each do |content|
      self.notes << Note.create(content: content) unless content == ""
    end

  end

  def note_contents
    notes.collect {|note| note.content}
  end

end
