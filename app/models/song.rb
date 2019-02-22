class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_id=(name)
    if name== nil || name == ""
      errors.add(:genre, "Invalid genre name")
    else
      self.genre = Genre.find_or_create_by(name: name)
    end
  end

  def genre_name=(name)
    if name== nil || name == ""
      errors.add(:genre, "Invalid genre name")
    else
      self.genre = Genre.find_or_create_by(name: name)
    end
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |c|
      if c == nil || c==""
        errors.add(:notes, "Invalid content")
      else
        @note = Note.find_or_create_by(content: c)
        self.notes << @note
      end
    end

  end

  def note_contents
    if !self.notes.empty?
      self.notes.collect do |n|
        n.content
      end
    else
      errors.add(:notes, "No note in the song")
    end
  end


end
