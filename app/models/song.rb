class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  	artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
  	self.artist.name if artist
  end

  def note_contents=(contents)
  	contents.each {|content| (self.notes << Note.create(content: content)) if !content.empty?}
  end

  def note_contents
  	self.notes.collect {|note| note.content}
  end

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
  	self.genre.name
  end


end

