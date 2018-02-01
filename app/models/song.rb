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

  def genre_id=(id)
  	self.genre = Genre.find_or_create_by(id: id)
  end

  def genre_id
  	self.try(:genre).try(:id)
  end

  def note_contents=(content)
  	content.each do |note|
  		if note != ""
  			self.notes.build(content: note)
  		end
  	end
  end

  def note_contents
  	self.notes.collect { |note| note.content } 
  end

  def genre_name=(genre)
  	self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name 
  	self.try(:genre).try(:name)
  end
end

