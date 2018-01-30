class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  #f.text_field :artist_name was calling the artist_name method on your fresh Song instance, 
  #in order to see if there was a value to set in the form field's value attribute
  #that method was raising an error because you can't call name on nil
  def artist_name 
    self.artist && self.artist.name
  end
end

