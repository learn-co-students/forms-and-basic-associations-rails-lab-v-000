class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    if self.artist
      self.artist.name
    else
      self.artist
    end
  end

  def note_contents=(contents)
    contents.each do |content|
        if !content.empty?
          self.notes.build(content:content)
        end
      end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_by(name: name )
  end

  def genre_name
    self.genre.name
  end

end
