class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_ids=(ids)
     ids.each do |id|
       genre = Genre.find(id)
       self.genre << genre
     end
  end

  def note_contents
    self.notes.map {|n| n.content}
  end

  def note_contents=(content)
    content.each do |word|
      note = Note.create(content: word) unless word.empty?
      self.notes << note unless note == nil 
    end
  end

end

