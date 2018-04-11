class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist #self.artist.name doesn't work. yyy?
  end

  def note_contents=(contents)
    contents.each do |c|
      self.notes << Note.find_or_create_by(content: c) if !c.empty?
    end
  end

  def note_contents
    # self.notes.map(&:content)
    #self.notes.pluck(:content)
    self.notes
  end
end
