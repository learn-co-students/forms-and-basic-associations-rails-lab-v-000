class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist.name if !self.artist.nil?
  end

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
    self.genre.name
  end



  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def note_contents=(note_contents)
    note_contents.select {|note_content| !note_content.empty?}.each do |note_content|
      self.notes << Note.find_or_create_by(content: note_content)
    end
  end

end
