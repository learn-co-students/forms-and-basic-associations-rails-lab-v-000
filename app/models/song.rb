class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :song_genre_id, :song_artist_name

  def genre_name
    self.genre.name
  end

  def note_contents
    self.notes.map(&:content)
  end

  def artist_name
    self.artist.name
  end

  def song_artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def song_genre_id=(id)
    self.genre = Genre.find(id)
  end

  def note_contents=(note_contents)
    note_contents.each do |content|
      if content != ""
        self.notes.build(content: content)
      end
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

end
