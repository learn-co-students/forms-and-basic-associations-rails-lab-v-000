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
		notes.each do |note|
			if note.present?
				@note = self.notes.build(content: note)
				@note.save
			end
		end
	end

	def note_contents
		 self.notes.map do |note|
		 	note.content
		 end
	end	

end
