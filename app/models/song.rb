class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name= (name)
    self.genre = Genre.find_or_create_by(name:name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name= (n)
    self.artist = Artist.find_or_create_by(name:n)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents
    self.notes.collect{|n| n.content}
  end

  def note_contents= (notes)
    notes.each {|n|
      self.notes << Note.create(content:n) if !n.empty?
      }
  end
end
