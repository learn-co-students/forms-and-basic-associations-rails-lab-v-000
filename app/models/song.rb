class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  validates :title, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_id=(id)
    self.genre = Genre.find(id)
  end

  def note_contents=(contents)
    contents.each do |content|
         self.notes << Note.find_or_create_by(content: content) if content != ""
   end
 end

  def note_contents
     self.notes.collect{|n|n.content}
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name
     self.artist.name
  end
end
