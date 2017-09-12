class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name= (name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
  	artist.name if !artist.nil?
  end

  def genre_id= (id)
  	self.genre = Genre.find(id)
  end

  def song_notes= (contents)
  	contents.each do |content|
  		self.notes << Note.create(content: content)
  	end
  end

  def note_contents
  	self.notes.map {|note| note.content}
  end





end

