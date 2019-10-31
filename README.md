# Forms And Basic Associations Rails Lab

## Objectives

1.  Practice defining associations
2.  Practice building forms in ERB

## A `Song` Library

In this lab, we're going to make a song library that helps record thoughts
about various `Song`s. Our data model looks like this:

- `Artist`
  - has a `name` attribute (`String`)
  - has many `Song`s
- `Song`
  - has a `title` attribute (`String`)
  - belongs to an `Artist`
  - belongs to a `Genre`
  - has many `Note`s
- `Genre`
  - has a `name` attribute (`String`)
  - has many `songs`
- `Note`
  - has `content` attribute (`String`)
  - belongs to a `Song`

## Instructions

The base models, controllers, and seed data have been provided for you.

First, connect the models by using the `ActiveRecord` association commands.

Next, write `app/views/songs/new.html.erb`. This form should have:
  - A text input box that sets the song's title.
  - A text input box for the artist.
  - A selection box for genre. Users should be able to pick amongst existing genres
    only.
  - Several text input boxes to add notes to the song. These should have the IDs
    `song_notes_1`, `song_notes_2`, and so on for the specs to pass. (You might need
    to search around for how to pass an array using `strong_params`!)
    There are feature tests!
  - **Hint:**  Write the `genre` getter and setter methods in the `Song` model.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/forms-and-basic-associations-rails-lab' title='Forms And Basic Associations Rails Lab'>Forms And Basic Associations Rails Lab</a> on Learn.co and start learning to code for free.</p>
