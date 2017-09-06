class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
  	self.artist.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
  	self.genre.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents
  	notes_content_array = []
  	self.notes.each do |note|
  		notes_content_array << note.content 
  	end
  	notes_content_array
  end

  def note_contents=(contents)
  	contents.each do |content|
  	  if !content.empty?
      	note = Note.find_or_create_by(content: content)
	  	self.notes << note
	  end
    end
  end
end

