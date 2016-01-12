require 'rails_helper'
require 'capybara/rspec'

describe "the song form", :type => :feature do
  it "has a title field" do
    visit '/songs/new'
    expect(page).to have_selector 'input[name="song[title]"]'
  end
end
