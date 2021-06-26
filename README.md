# Tactile Tabletop

In order for any of this to work, install Squib!
https://squib.readthedocs.io/en/v0.16.0/install.html
guide doesn't spell this out, but after installing ruby (which _does_ take forever) you should have a ruby command-line option in your start applications. that's where all the commands function. The minimum you need are:

gem install squib
gem install game_icons
bundle install

And then when you want to make the cards:

ruby C:\<wherever you cloned this repo>\helloworld.rb


# Workflow looks like this:
- add/import cards into testCardInput.csv
- edit layout.yml to define new elements/edit where elements go
- edit the .rb file to 1) pull in the data from the csv, 2) define what elements exist (background, rectangles, etc.), 3) where what data goes (ie: `text str: data['topAbilityName'], layout: 'title1'`)
- call `ruby` on the rb file
- review card pngs/pdfs saved to the output folder
