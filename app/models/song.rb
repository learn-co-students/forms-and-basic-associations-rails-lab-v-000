class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
  	self.try(:genre).try(:name)
  end



  def artist_name
  	self.try(:artist).try(:name)
  end

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents=(arr)
  	note_arr = arr.collect do |content|
  		self.notes << Note.create!(content: content)
  	end
  	binding.pry
  end

  def note_contents
  	self.notes.collect{ |note| note.content unless note.content == ""}.compact
  end

end

