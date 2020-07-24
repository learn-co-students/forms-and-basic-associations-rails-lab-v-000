class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :genre
  belongs_to :artist

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def notes=(notes)
    notes.each do |n|
      self.notes << Note.create(content: n) unless n == "" || n == nil
    end
  end

  def note_contents
    array = []
    self.notes.each do |n|
      array << n.content
    end
    array
  end

  def note_contents=(notes)
    notes.each do |n|
      self.notes << Note.create(content: n) unless n == "" || n == nil
    end
  end

end
