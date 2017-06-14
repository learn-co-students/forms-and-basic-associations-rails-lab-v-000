class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
     
  def genre_name=(name)
  	genre = Genre.find_or_create_by(name: name)
  	self.genre = genre
  end

  def genre_name
  	if !self.genre.nil?
  		self.genre.name
  	end
  end

  def artist_name=(name)
  	artist = Artist.find_or_create_by(name: name)
  	self.artist = artist
  end

  def artist_name
    self.artist.name unless self.artist.nil?
  end
  
  def note_contents=(array)
  	array.each do |note|
  		if note.strip != ''
	  		note = Note.find_or_create_by(content: note) 
	  		self.notes << note
  		end
  	end 	
  end

  def note_contents
  	if !self.notes.nil?
	  	self.notes.map do |note|
	        note.content
	  	end
	end  	
  end
end

