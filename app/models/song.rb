class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.try(:artist).try(:name)
    # unless self.artist.nil?
    #   self.artist.name
    # end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.try(:genre).try(:name)
    # unless self.genre.nil?
    #   self.genre.name
    # end
  end

  def note_contents=(contents)
    contents.each do |content|
      unless content.strip == ""
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.collect{ |note| note.content }
  end
end