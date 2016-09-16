class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist.try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.try(:name)
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def note_contents
    self.notes.collect { |note| note.content }
  end

  def note_contents=(contents)
    contents.each do |note|
      unless note.empty?
        self.notes.build(content: note)
      end
    end
  end
end
