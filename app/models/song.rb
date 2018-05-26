class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(note_array)
    note_array.each do |n|
      note = Note.new(content: n)
      if note.save
        self.notes << note 
      end
    end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end
end

