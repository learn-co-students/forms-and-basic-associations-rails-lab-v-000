class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  #Needed to make this, or else rails raised error
  def artist_name
    if self.artist_id
      Artist.find(self.artist_id).name
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name)
  end

  def genre_name
    if self.genre_id
      Genre.find(self.genre_id).name
    end
  end

  def note_contents=(arr)
    #reject empty
    arr.reject(&:empty?).each do |content|
      self.notes << Note.create!(content: content)
    end
  end

  def note_contents
    self.notes.map(&:content)
  end

end
