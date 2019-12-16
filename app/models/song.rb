class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre

  has_many :notes
  #accepts_nested_attributes_for :notes

  def note_contents=(contents)
    contents.each do |content|
      self.notes.build(content: content) unless content.blank?
    end
  end

  def note_contents
    if self.notes
      self.notes.collect {|note| note.content}
    end
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
end
