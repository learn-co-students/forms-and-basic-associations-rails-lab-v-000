require 'rails_helper'
require 'capybara/rspec'

describe "the song form", :type => :feature do
  it "creates a song on submit" do
    visit '/songs/new'
    fill_in :song_title, with: 'Little Earthquakes'
    find('input[name="commit"]').click
    expect(Song.last.title).to eq 'Little Earthquakes'
  end
end
