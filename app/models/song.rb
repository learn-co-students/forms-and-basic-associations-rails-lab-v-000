class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes


  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents=(notes)
    notes.each do |content|
      self.notes.build(content: content) if content.strip != ''
    end
  end

  def note_contents
    self.notes.map{|note| note.content}
  end

end
