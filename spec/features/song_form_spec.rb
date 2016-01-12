require 'rails_helper'
require 'capybara/rspec'

describe "the song form", :type => :feature do
  it "creates a song on submit" do
    visit '/songs/new'
    fill_in :song_title, with: 'Little Earthquakes'
    find('input[name="commit"]').click
    expect(Song.last.title).to eq 'Little Earthquakes'
  end

  it "creates a song with an artist" do
    visit '/songs/new'
    fill_in :song_title, with: 'Little Earthquakes'
    fill_in :artist_name, with: 'Tori Amos'
    find('input[name="commit"]').click
    expect(Song.last.artist.name).to eq 'Tori Amos'
    expect(Artist.find(name: 'Tori Amos').songs.pluck(:title)).to include 'Little Earthquakes'
  end
end
