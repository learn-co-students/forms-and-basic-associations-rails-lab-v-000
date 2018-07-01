class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_id=(genre_id)
    @genre = Genre.find_or_create_by(id: genre_id)

    self.genre = @genre
  end

  def genre_id
    self.genre.id if self.genre
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(artist_name)
    @artist = Artist.find_or_create_by(name: artist_name)

    self.artist = @artist
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents=(note_contents)
    note_contents.each do |nc|
      unless nc.empty?
        note = Note.find_or_create_by(content: nc)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end
