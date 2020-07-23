class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(:name => artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(genre_id)
    self.genre = Genre.find(genre_id)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(:name => name)
  end

  def genre_id
    self.genre_name
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(contents)
    self.note_ids = contents
  end

  def note_contents
    self.note_ids
  end

  def note_ids=(ids)
    ids.each do |id|
      n = Note.new(:content => id) unless id.blank?
      self.notes << n if n
    end
  end

  def note_ids
    self.notes ? self.notes.collect {|n| n.content} : nil
  end
end
