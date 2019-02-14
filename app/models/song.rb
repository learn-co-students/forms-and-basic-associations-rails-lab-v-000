class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(:name => name)
  	self.save
  end

  def artist_name
  	self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(:name => name)
  	self.save
  end

  def genre_name
  	self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
  	notes.each do |note|
  		new_note = Note.new(:content => note)
  		if new_note.valid?
  			self.notes << new_note
  		end
  	end
  end

  def note_contents
  	self.notes.collect do |note|
  		note.content
  	end
  end
end
