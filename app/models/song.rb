class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :artist_name, :genre_name

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def note_contents=(content)
    content.each do |c|
      if c != ""
        note = Note.find_or_create_by(content: c)
        self.notes << note
      end
    end
  end

  def note_contents
    notes.collect {|note| note.content}
  end

  def genre_name
    genre.name unless genre.nil?
  end

  def artist_name
    artist.name unless artist.nil?
  end
end
