class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    self.artist= Artist.find_or_create_by(name: name)
  end


  def genre_name
    self.try(:genre).try(:name)
  end

  def genre_name=(name)
    self.genre= Genre.find_or_create_by(name: name)
  end

  def note_contents
    self.notes.map { |note| note.content }
  end

  def note_contents=(content)
    content.map do |c|
      if c == ""
        c.delete
      else
        format_array = self.notes << Note.create(:content=> c)
      end
    end
  end

end
