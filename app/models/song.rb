class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many   :notes

  validates :title, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if !artist.nil?
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name if !genre.nil?
  end

  def notes_1=(note)
    set_note(1, note)
  end

  def notes_1
    get_note(1)
  end

  def notes_2=(note)
    set_note(2, note)
  end

  def notes_2
    get_note(2)
  end

  def note_contents=(contents)
    self.notes = [] if self.notes.nil?
    contents.each_with_index { |content, i|
      self.notes << Note.new(content:content) if content.size > 0
    }
  end

  def note_contents
    self.notes.collect { |note| note.content }
  end

private

  def set_note(num, note)
    if self.notes.nil? || self.notes.size < num
      self.notes << Note.new(content: note)
    else
      self.notes[num-1].content = note
    end
  end

  def get_note(num)
    if !self.notes.nil? && self.notes.size > num-1
      self.notes[num-1].content
    end
  end
end
