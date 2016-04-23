<!-- <%= f.label :artist %>
<%= f.text_field :artist, list: "artists_autocomplete", id: "song_artist_name" %>
<datalist id="artists_autocomplete">
  <%= Artist.all.each do |artist| %>
    <option value="<%= artist.name %>">
  <% end %>
</datalist>
<br /><br />

<%= f.label :genre %>
<%= f.collection_select :genre, Genre.all, :id, :name %>
<br /><br /> -->

<!-- <%= f.label :note %>
<input name="song_note_contents_ids[]" -->
