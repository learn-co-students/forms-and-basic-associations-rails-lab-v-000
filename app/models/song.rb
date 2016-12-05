class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  validates_presence_of :title

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
  	self.artist.name if self.artist
  end

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
  	self.genre.name
  end

  def notes=(notes)
  	notes.each do |note|
  		self.notes << Note.create(content: note[:content])
  	end
  end

  def note_contents=(notes_array)
  	notes_array.each do |note|
  		self.notes << Note.create(content: note) unless note.empty?
  	end
  end

  def note_contents
  	self.notes.map { |note| note.content }
  end

  # def genre_name=(name)
  # 	self.genre = Genre.find_or_create_by(name: name)
  # end

  # def genre_name
  # 	self.genre.name if self.genre
  # end

end

