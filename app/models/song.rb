class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre
  has_many :notes

  def genre_name=(genre_name)
    self.genre = Genre.find_or_create_by(name: genre_name)
  end

  def genre_name
    self.try(:genre).try(:name)
    # self.genre.name ? self.genre.name : nil
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.try(:artist).try(:name)

  #  self.artist.name ? self.artist.name : nil

  end

  def note_contents=(note_contents)
      note_contents.each do |content|
      if content != ""
        note = Note.create(content: content)
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map {|note| note.content}
  end
end
