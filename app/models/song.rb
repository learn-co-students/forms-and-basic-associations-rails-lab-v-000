class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def note_contents=(notes_array)
  	notes_array.each do |content|
  		 note = Note.new(content: content)
  		 self.notes << note
  	end
  end

  def convert_to_notes
  	notes_array.each do |content|
  		 note = Note.new(content: content)
  		 self.notes << note
  	end
  end

  def note_contents
  	notes = self.notes.map { |note| note.content }
  	notes.reject { |note| note == '' }
  end

  def song_genre_id=(id)
  		genre = Genre.find(id)
  		self.genre = genre
  end

  def song_genre_id
  	unless self.genre
  		nil
  	end
  end

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
  	self.genre.name
  end

  def artist_name=(name)
  		artist = Artist.find_or_create_by(name: name)
  		self.artist = artist
  end

  def artist_name
  	unless self.artist
  		nil
  	else
  		self.artist.name
  	end
  end

  def song_title=(title)
  	self.title = title
  end

  def song_title
  	self.title
  end
end

