Notes.md

1. Populate select options based on association options.
2. Assign a foreign key based on a select box value directly through mass assignment (post[category_id]).
3. Define a belongs_to association writer.
4. Build a form field that will delegate to a belongs_to association writer (post#category_name=) through controller mass assignment.
5. Define a has_many association writer.
6. Build a form field that will delegate to a has_many association writer (owner#pet_names=) through controller mass assignment.