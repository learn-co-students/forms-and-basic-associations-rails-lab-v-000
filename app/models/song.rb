class Song < ActiveRecord::Base
	belongs_to :artist
	belongs_to :genre
	has_many :notes

	def artist_name=(name)
		self.artist = Artist.find_or_create_by(name: name)
	end

	def artist_name
		if self.artist.present?
			self.artist.name 
		else self.artist = nil
		end
	end

	def genre_name=(name)
		self.genre = Genre.find_or_create_by(name: name)
	end

	def genre_name
		if self.genre.present?
			self.genre.name
		else self.genre = nil
		end
	end

	def note_contents=(notes)
		binding.pry
		self.notes.each do |note|
			@note = Note.new
			@note.song.notes.build(note)
			@note.save
		end
	end

	def note_contents
		# binding.pry
	# 	if self.notes.present?
	# 		self.notes.each do |note|
	# 			self.notes << note
	# 		end
	# 	end
	end	

end
