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

  def note_contents=(note_contents)
    note_contents.each do |note|
      if !note.empty?
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    self.notes.collect {|note| note.content}
  end

end
