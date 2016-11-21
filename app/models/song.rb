class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    @artist_name = self.artist.name
  end

  def artist_name
    @artist_name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    @genre_name = self.genre.name
  end

  def genre_name
    @genre_name
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.to_s != ''
        self.notes.new(content: content)
      end
    end
  end

  def note_contents
    self.notes.map{|note| note.content }
  end
end
