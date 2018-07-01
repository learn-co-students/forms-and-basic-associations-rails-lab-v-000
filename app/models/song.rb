class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_id=(genre_id)
    @genre = Genre.find_or_create_by(id: genre_id)

    self.genre = @genre
  end

  def genre_id
    self.genre.id if self.genre
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

end
