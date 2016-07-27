class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

## try(*a, &b) is defined to be able to write:
## `@person.try(:name)`

## instead of:
## @person.name if @person

## try calls can be chained:
## @person.try(:spouse).try(:name)

## instead of:
## @person.spouse.name if @person && @person.spouse

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
    # self.try(:artist).try(:name)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name 
    # self.try(:genre).try(:name)
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ""
        self.notes << Note.create(content: content)
        # self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end
end

