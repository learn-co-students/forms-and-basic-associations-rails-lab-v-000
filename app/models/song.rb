class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def song_artist_name
	  self.artist_name
  end

  def artist_name=(name)
	  self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
	  self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
	  self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
	  self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
	  notes.each do |each_note|
		unless each_note.strip.empty?
	  		self.notes.build(content: each_note)
		end
	end
  end

  def note_contents
	  self.notes ? self.notes.map {|note| note.content } : nil
  end
end
