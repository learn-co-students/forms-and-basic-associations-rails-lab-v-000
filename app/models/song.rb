class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name unless self.artist == nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name)
  end

  def note_contents=(arr)
    # binding.pry
     arr.each do |content|
       unless content == ""
         self.notes.build(content: content)
       end
     end
   end

  def note_contents
    # binding.pry
    self.notes.map(&:content)
  end
end
