
[1mFrom:[0m /home/learn/Development/Code/forms-and-basic-associations-rails-lab-v-000/app/controllers/songs_controller.rb @ line 17 SongsController#create:

    [1;34m15[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m16[0m:   @song = [1;34;4mSong[0m.new(song_params)
 => [1;34m17[0m:   binding.pry
    [1;34m18[0m: 
    [1;34m19[0m:   [32mif[0m @song.save
    [1;34m20[0m:     redirect_to @song
    [1;34m21[0m:   [32melse[0m
    [1;34m22[0m:     render [33m:new[0m
    [1;34m23[0m:   [32mend[0m
    [1;34m24[0m: [32mend[0m

