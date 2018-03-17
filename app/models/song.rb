class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name) #setter
  	self.artist=Artist.find_or_create_by(name: name)
  end

  def artist_name #getter
  	# self.artist.name if self.artist
  	self.try(:artist).try(:name)
  end


  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
  	# self.genre.name if self.genre
  	self.try(:genre).try(:name)
  end

  def note_contents=(notes)
  	notes.each do |content|
  		if content != ""
  			self.notes << Note.create(content: content)
  		end
  	end
  end

  def note_contents
  	self.notes.collect do |note|
  		note.content
  	end
  end


end

