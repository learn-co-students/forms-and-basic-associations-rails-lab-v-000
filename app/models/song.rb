class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
  	self.artist.name if artist
  end

  def note_contents=(contents)
  	contents.each do |content|
  		self.notes << Note.create(content: content)
  	end
  end

  def note_contents
  	contents = []
  	notes.each do |note|
  		if !(note.content.empty?)
  			contents << note.content
  		end
  	end
  	contents
  end

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
  	self.genre.name
  end


end

