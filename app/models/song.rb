class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
  end

  def artist_name

  end

  def genre_name=(name)
  end

  def genre_name
  end

  def note_contents=(notes)
  end

  def note_contents
  end
end

