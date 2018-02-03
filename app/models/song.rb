class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
  	if self.artist
  		self.artist.name
  	else
  		"Artist Unknown"
  	end
  end

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
  	if self.genre
  		self.genre.name
  	else
  		"Genre Unknown"
  	end
  end

  def note_contents=(note_array)
  	note_array.each do |note|
  		if note != ""
  			note = Note.create(content: note, song: self)
  			self.notes << note
  		end
  	end
  end

  def note_contents
  	self.notes.map do |note|
  		note.content
  	end
  end
end

