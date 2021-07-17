require 'squib'
require 'game_icons'

data = Squib.csv file: 'Action Cards - Weapons.csv'
#grabbing icons from https://game-icons.net/
#using gem game_icons to be able to load them


#width/height/dpi measurements provided by template from BoardGameMaker.com, see poker-size.pdf
Squib::Deck.new(dpi: 300, width: 820, height: 820, cards: data['Weapon Name'].size, layout: 'weaponcardlayout.yml')  do

  ## overall card stuff

  background color: 'black'
  rect layout: 'cut'
  rect layout: 'safe'
  
  ## top ability stuff
  text str: data['Weapon Name'], layout: 'WeaponTitle'
  
  text str: "Attack Die:", layout: 'AttackTitle'
  svg file: data['Attack Die 1'].map {|t| "#{t.downcase}.svg" }, layout: 'AttackDie1'  
  svg file: data['Attack Die 2'].map {|t| "#{t.downcase}.svg" }, layout: 'AttackDie2'
  
  text str: "Defense Die:", layout: 'DefenseTitle'
  svg file: data['Defense Die'].map {|t| "#{t.downcase}.svg" }, layout: 'DefenseDie'
  
  text str: "Range:", layout: 'RangeTitle'
  text str: data['Range'], layout: 'RangeValue'
  
  text str: "Requirements:", layout: 'RequirementsTitle'
  svg file: data['Requirement'].map {|t| "#{t.downcase}.svg" }, layout: 'RequirementsValue'
  
  text str: "Notes:", layout: 'NotesTitle'
  text str: data['Extra Notes'], layout: 'NotesValue'

  # ## output file stuff

  save_png prefix: 'ttwc_'
  #save_pdf trim: 37.5
end

Squib::Deck.new(dpi: 300, width: 820, height: 820, cards: 1, layout: 'weaponcardlayout.yml')  do

  ## overall card stuff

  background color: 'black'
  rect layout: 'cut'
  rect layout: 'backOfCards'
  svg data: GameIcons.get('swords-emblem').recolor(fg: 'fff', bg: '000', fg_opacity: 1, bg_opacity: 0).string, layout: 'emblemBack'
  ## output file stuff

  save_png prefix: 'ttwc_BACK'
  #save_pdf trim: 37.5
end