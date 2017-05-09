class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist && artist.name
  end

  def note_contents=(contents)
    contents.each do |n|
      unless n.blank?
        notes << Note.new(content: n)
      end
    end
  end

  def note_contents
    notes.collect do |f|
      f.content
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    genre && genre.name
  end
end
