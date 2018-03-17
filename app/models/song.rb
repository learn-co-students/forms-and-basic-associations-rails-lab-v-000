class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
  	self.try(:artist).try(:name)
  end

  def artist_name=(name)
  	artist = Artist.find_or_create_by(name: name)
  	self.artist = artist
  end

  def genre_name
  	self.genre.name
  end

  def genre_name=(name)
  	genre = Genre.find_or_create_by(name: name)
  	self.genre = genre
  end

  def note_contents=(contents)
  	contents.each do |content|
  		if content.strip != ''
  			self.notes.build(content: content)
  		end
  	end
  end

  def note_contents
  	self.notes.map(&:content)
  end
  
end

