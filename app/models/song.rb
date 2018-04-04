class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    # self.save
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
    # self.save
  end

  def artist_name
    self.artist.try(:name)
  end

  def genre_name
    self.genre.try(:name)
  end

  def note_contents=(contents)
    contents.each do |content|
      note = Note.find_or_create_by(content: content)
      if !note.content.empty?
        self.notes << note
      end
    end
  end

  def note_contents
    self.notes.collect{|note| note.content}
  end
end

