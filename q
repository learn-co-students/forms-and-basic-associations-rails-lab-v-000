
[1mFrom:[0m /mnt/c/Users/sdcro/dev/flatiron/labs/forms-and-basic-associations-rails-lab-v-000/app/controllers/songs_controller.rb @ line 19 SongsController#create:

    [1;34m17[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m18[0m:   @song = [1;34;4mSong[0m.new(song_params)
 => [1;34m19[0m:   binding.pry
    [1;34m20[0m: 
    [1;34m21[0m:   [32mif[0m @song.save
    [1;34m22[0m:     redirect_to @song
    [1;34m23[0m:   [32melse[0m
    [1;34m24[0m:     render [33m:new[0m
    [1;34m25[0m:   [32mend[0m
    [1;34m26[0m: [32mend[0m

