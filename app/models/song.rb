class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
  	genre.name if genre
  end

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
  	artist.name if artist
  end

  def note_contents=(note_contents)
  	note_contents.each do |content|
  		note = Note.find_or_create_by(content: content)
  		self.notes << note if note.valid?
  	end
  end

  def note_contents
  	contents = notes.collect {|note| note.content} if notes
  end
end

