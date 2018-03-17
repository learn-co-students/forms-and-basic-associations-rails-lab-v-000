class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
  	self.try(:artist).try(:name)
  end

  def song_genre_id=(id)
  	self.genre = Genre.find_by(id: id)	
  end

  def genre_name=(name)
  	self.genre = Genre.find_by(name: name)
  end

  def genre_name
 	self.genre.name
  end

  def note_contents=(notes)
  	notes.each do |content|
  		if content.strip != ''
  			self.notes.build(content: content)
  		end
  	end
  end

  def note_contents
  	self.notes.collect { |note| note.content }
  end

end

