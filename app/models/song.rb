class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist=Artist.find_or_create_by(name: name)
  end

  def notes=(notes_array)
byebug
    notes_array.each {|n|
      self.notes << Note.create(content: n.content)

    }
  end
end

