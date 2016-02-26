class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    #artist.name unless artist.nil?
    try(:artist).try(:name)
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents
    notes.map { |note| note.content }
  end

  def note_contents=(new_notes)
    new_notes.each do |content|
      unless content.empty?
        note = Note.create(content: content)
        notes << note
      end
    end
  end
end

