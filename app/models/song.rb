require 'pry'
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
    if self.artist != nil

  	 self.artist.name
    end
  end

  def note_contents=(contents)
    song_id = self.id
  	contents = contents.reject{|content| content.empty?}
  	contents.each do |content|
  		note = Note.find_or_create_by(content: content)
      note.song_id = song_id
      note.save
      self.notes << note
  	end
  end

  def note_contents
  	self.notes.collect {|note| note.content}
  end
end

