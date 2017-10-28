require 'pry'
class Song < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def note_contents
    content = []
     self.notes.each do |n|
       content << n.content
     end
    return content
  end

  def note_contents=(notes)
    #binding.pry
    notes.each do |n|
      if n != ""
      self.notes.build(content: n, song_id: self.id)
      end
    end
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
    self.save
  end

  def artist_name
    if self.artist != nil
      self.artist.name
    end
  end

  def genre_name
    self.genre.name
  end


  def genre_id=(id)
    genre = Genre.find(id)
    self.genre = genre
  end

  def genre_name=(name)
    genre = Genre.find_by(name: name)
    self.genre = genre
  end



end
