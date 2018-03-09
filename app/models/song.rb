class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
  	self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
  	self.genre.name
  end

  def artist_name=(name)
  	self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
	self.artist.name unless self.artist_id == nil
  end

  def note_contents=(notes)
    notes.each {|content| self.notes.build(content: content) unless content.strip == ''}
  end

  def note_contents
    self.notes.map(&:content)
  end

  # def note_contents=(note)
  # 	self.notes.update(:note_contents => note)
  # 	# note.each {|n| self.notes << n }
  # end

  # def note_contents
  # 	self.notes
  # end
end

