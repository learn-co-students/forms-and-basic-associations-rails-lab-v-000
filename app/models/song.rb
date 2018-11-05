class Song < ActiveRecord::Base
  # add associations here
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

  def note_ids=(ids)
    ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end

  def note_contents
    c = []
    self.notes.each do |note|
      c << note.content
    end
    c
  end

  def note_contents=(n_contents)
    n_contents.each do |n|
      if !n.blank?
        note = Note.find_or_create_by(content: n)
        self.notes << note
      end
    end
  end
end
