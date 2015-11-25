
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

1. songs/form

songs have a name
songs have a genre and genre should be set via a select box of genre options writing to song[genre_id]

songs should have an artist and you should be able to find or create an artist by name using a form field song[artist_name] and a custom writer artist_name=

2. artists/form

artists have a name

when creating an artist you should be able to add an arbitrary amount of songs via artist[song_names][] and a custom writer artist#song_names= that can take a list of song names as strings and for each one build an associated song for the artist with that name. the song edit form should then be able to edit that song and assign a genre.
