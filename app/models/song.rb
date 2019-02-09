class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def artist_name
  	artist ? artist.name : nil
  end

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
  	genre ? genre.name : nil
  end

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents
  	notes.map{|note| note.content}
  end

  def note_contents=(contents)
  	self.save if id.nil?
  	@note_contents ||= []
  	contents.each do |content|
  		@note_contents.push self.notes.find_or_create_by(content: content, song: self).content unless content.blank?
  	end
  end

end
