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

1. The base models, controllers, and seed data have been provided for you.
2. You should create and migrate the database before starting to develop your
   solution.
3. Seeding the database provides many `Genre`s. You will add data about
   `Artist`s, `Note`s, and `Song`s during the development of this application.
   The `ArtistsController` and `SongsController` have been built out so that you
   can do this.

First, connect the models by using the `ActiveRecord` association commands.

Next, update the minimal `app/views/songs/new.html.erb`.

This view should have a form that provides:
  - A text input box that sets the `Song`'s title.
  - A text input box for the `Artist`.
  - A selection box for `Genre`. Users should be able to pick amongst existing genres only.
  - Several text input boxes to add notes to the song. These should have the IDs
    `song_notes_1`, `song_notes_2`, and so on for the specs to pass.
    - **Hints**
      - You might need to search for information on passing an `Array` using `strong_params`!
      - It's easy to get confused between getting a `Genre` instance from a
        `Song` and a `Genre`'s name. Adding a `genre_name` getter and setter
        method that wraps working with an associated `Genre` might be helpful.
  - There are feature tests!

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/forms-and-basic-associations-rails-lab' title='Forms And Basic Associations Rails Lab'>Forms And Basic Associations Rails Lab</a> on Learn.co and start learning to code for free.</p>
