<%= f.text_field :artist, list: "artists_autocomplete" %>
<datalist id="artists_autocomplete">
  <%= Artist.all.each do |artist| %>
    <option value="<%= artist.name %>">
  <% end %>
</datalist>
