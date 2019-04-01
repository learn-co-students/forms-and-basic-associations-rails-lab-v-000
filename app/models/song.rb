class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    self.try(:artist).try(:name)
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.try(:genre).try(:name)
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
