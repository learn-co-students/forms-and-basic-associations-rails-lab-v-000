require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
  	self.artist.name if self.artist
  end

  def note_contents=(contents)
  	contents.each do |c|
  		if c != ""
	  		content_add = Note.find_or_create_by(content: c) 
	  		self.notes << content_add
  		end
  	end
  end

  def note_contents
  	# binding.pry
  	self.notes.map{|n| n.content}
  end

  def genre_name=(name)
  	self.genre = Genre.find_by(name: name)
  end

  def genre_name
  	self.genre.name if self.genre
  end
end

