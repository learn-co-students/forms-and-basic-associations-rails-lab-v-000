class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents=(content)
    content.each do |c|
      note = Note.find_or_create_by(content: c)
      self.notes << note
    end
  end

  def note_contents
    self.notes ? self.notes.map(&:content).select { |content| !content.empty? } : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

end
