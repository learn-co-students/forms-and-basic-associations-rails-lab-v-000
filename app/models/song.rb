class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

	
	def genre_name=(genre)
		self.genre = Genre.find_or_create_by(name: genre)
	end 

	def genre_name
		self.genre.name unless self.genre.nil?
	end

	def artist_name=(artist)
		self.artist = Artist.find_or_create_by(name: artist)
	end

	def artist_name
		self.artist.name unless self.artist.nil?
	end

	def note_contents=(notes)
		puts notes
		notes.each {|note| self.notes << Note.find_or_create_by(content: note) unless note.empty?}
		
	end

	def note_contents
		self.notes.map {|note| note.content}
	end

end

