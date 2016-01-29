class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_id=(genre_id)
    self.genre = Genre.find(genre_id)
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    unless self.artist.nil?
      self.artist
    end
  end

  def genre_id=(genre_id)
    self.genre = Genre.find(genre_id)
  end

  def genre_id
    unless self.genre.nil?
      self.genre
    end
  end

  def note_contents=(notes)
    notes.each do |note|
      unless note.empty?
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    self.notes.map{|note| note.content}
  end
end