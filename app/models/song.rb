class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
  	if self.genre 
  		self.genre.name
  	end
  end

  def genre_id=(id)
  	self.genre = Genre.find_or_create_by(id: id)
  end

  def genre_id
  	if self.genre
  		self.genre.id
  	end
  end

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end
	
  def artist_name
  	if self.artist
  		self.artist.name
  	end
  end

  def note_contents=(contents)
  	contents.each do |content|
  		if !content.empty?
  			note = Note.find_or_create_by(content: content)
  			self.notes << note
  		end
  	end
  end

  def note_contents
  	@contents = []
  	self.notes.each do |note|
  		@contents << note.content
  	end
  	@contents 
  end

  def note_ids=(ids)
  	ids.each do |id|
  		note = Note.find(id)
  		self.notes << note
  	end
  end


  
end

