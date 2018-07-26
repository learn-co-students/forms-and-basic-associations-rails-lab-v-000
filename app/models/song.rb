class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genrename)
    new_genre = Genre.find_or_create_by(name: genrename)
    self.genre = new_genre
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def artist_name=(artistname)
    new_artist = Artist.find_or_create_by(name: artistname)
    self.artist = new_artist
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def note_contents=(arr_note_contents)
    arr_note_contents.each do |note|
      if note != ""
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end

end
