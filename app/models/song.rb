class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  attr_reader :artist_name
  

  
  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end
  
  def note_contents=(contents)
  	contents.each do |note|
  		if note.strip != ""
  		self.notes << Note.find_or_create_by(content: note, song_id: self.id)
  		end
  	end
  end

  def note_contents
  	self.notes.collect { |x| x.content }
  end

end

