# Forms And Basic Associations Rails Lab

## Objectives

1. Populate select options based on association options.
2. Assign a FK based on a select box value directly through mass assignment. (post[category_id])
3. Define a belongs_to association writer.
4. Build a form field that will delegate to a belongs_to association writer. (post#category_name=) through controller mass assignment.
5. Define a has_many association writer.
6. Build a form field that will delegate to a has_many association writer. (owner#pet_names=) through controller mass assignment.

## Notes

We'll give them the base models and controllers with index and show actions but they have to create migrations to add the correct foreign keys and wire up the associations correctly. then they will need to create the new/create and edit/update actions along with the forms that have the correct fields that write associated data to the model through custom writers.

## A song library

In this lab, we're going to make a song library. Our data model looks like this:

* Artist
  * artists have a name (string)
  * artists have many Songs
* Song
  * songs have a title (string)
  * songs belong to an Artist
  * songs belong to a Genre
* Genre
  * genres have a name (string)
  * genres have many songs
* Notes
  * notes have content (string)
  * notes belong to a Song

## Instructions

The base models, controllers, and seed data have been provided for you. The associations have not been wired up.

1. Create migrations and model associations between Artist, Song, and Note.
2. Write `app/views/songs/_form.html.erb`. This form should have:
  * A text input box that sets the song's name.
  * A text input box for the artist, which autocompletes with existing Artist names.
  * A selection box for genre. Users should be able to pick amongst existing genres only.
  * Several text input boxes to add notes to the song. These should have the ids `song_note_contents_1`, `song_note_contents_2`, and so on for the specs to pass.

There are feature tests and model tests. In the end, they should all pass.

<a href='https://learn.co/lessons/forms-and-basic-associations-rails-lab' data-visibility='hidden'>View this lesson on Learn.co</a>
