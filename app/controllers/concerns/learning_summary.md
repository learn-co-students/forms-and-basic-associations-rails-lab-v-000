#
#





Thurs 2/21
(about collection_select. I was working in the songs new page, making a drop down so users could pick genres from a list.)
#the first argument represents what method you want to work with. it's genre id because that's how the song calls its genre, and its declared already.
#the second is where you want to grab the selection from.maybe can use an array? the third
# third is the value of each individual selection. thats what will be passed to your params if the
# selection is made. the value will be passed. The user won't see this. so it makes sense for it
# to be the id.
---------------
<!-- questions  -->



<!-- look up the build method, which lets you build an association atop a new instance  -->
<!-- ...
can we diagram the data flow that lead up to the problem


whatever you put in the songs controller strong params method has to match the method in the model. the job of that method is to associate it with the song. and because we have an array we can interate over the two notes

the method in the model will iterate over the two notes, which are rpobably strings, create note objects and then associate them to the song.


So basically i have to work from the form to the controller to the model or within those things. In the form, the html inputs will gather the info for the two notes. that will become an array that will be part of the params. then the form gets submitted. it goes to the controller, where the strong params method will gather and screen the form information including the notes array and send it to the create method further up. There, mass assignment will be used to use the params info to make a new song. but as part of that process, rails will reach into the model (song or notes model?) to run a notes method that will be responsible for creating two new notes objects and associating them to the song (won't the associating part happen in the create method?).

basically i have to make a method that will take the notes from the form and change them into an array to send to strong params (or not, i remember that setting up the html tags in a certain way sends them to params in a certain structure. yeah thats probably it. then look up, like the lab says, how to pass an array to strong params )


-----------------

TO WORK ON




WORKING ON
2 trying to make a new song with genre. i want to call Song.first.genre in the rails console, but its nil and setting it to a string doens't work either.

2 maybe it fails the validation? like there should be strong params option in songs controller for a new genre


WORKED ON

1 I’m trying to let the new song form make a new song with an artist. So I’m working on associations and now I’m checking if the database schema needs foreign keys for songs and potentially notes
1 song doesn’t have an artist method, like song.artist. I remember this was dealt with in the last lab or maybe before, and there were setter and getter methods customized.
1 my question is, didn’t we not have to do this before? I think I’ve been able to call .artist without having to do setter and getter methods for a while now. -->
