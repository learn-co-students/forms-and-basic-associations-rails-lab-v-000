class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #genre_name
  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  #artist_name
  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  #note_contents
  def note_contents
    self.notes.collect{ |note| note.content }
  end

  def note_contents=(content)
    content.each do |note_content|
      self.notes << Note.find_or_create_by(content: note_content) unless note_content.empty?
    end
  end

end
