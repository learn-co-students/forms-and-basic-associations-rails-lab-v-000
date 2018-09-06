class Song < ActiveRecord::Base
belongs_to :genre
belongs_to :artist
has_many :notes

def artist_name
end

def artist_name=()
end

end
