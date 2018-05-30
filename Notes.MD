<!-- <%= f.label :artist %>
<%= f.text_field :artist %>
<br />
<%= f.collection_select :genre_name, Genre.all, :name, :name %>
<br />
<%= f.text_field :song_notes, list: "song_notes_autocomplete" %>
  <datalist id="song_notes_autocomplete">
    <% Song.all.each do |song| %>
      <option value="<%= notes.name %>">
    <% end %>
  </datalist>
  <textarea name="song[notes]"></textarea> -->
