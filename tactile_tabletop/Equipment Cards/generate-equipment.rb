require 'squib'
require 'game_icons'

data = Squib.csv file: 'Tactile Tabletop Data - Equipment.csv'
#grabbing icons from https://game-icons.net/
#using gem game_icons to be able to load them


#width/height/dpi measurements provided by template from BoardGameMaker.com, see poker-size.pdf
Squib::Deck.new(dpi: 300, width: 820, height: 820, cards: data['Equipment Name'].size, layout: 'equipmentcardlayout.yml')  do

  ## overall card stuff

  background color: 'black'
  rect layout: 'cut'
  rect layout: 'safe'
  
  ## top ability stuff
  text str: data['Equipment Name'], layout: 'EquipmentTitle'

  text str: "Slot:", layout: 'SlotTitle'
  text str: data['Slot'], layout: 'SlotValue'
  text str: "Effect:", layout: 'EffectTitle'
  text str: data['Effect'], layout: 'EffectValue'

  # ## output file stuff

  save_png prefix: 'ttec_'
  #save_pdf trim: 37.5
end

Squib::Deck.new(dpi: 300, width: 820, height: 820, cards: 1, layout: 'equipmentcardlayout.yml')  do

  ## overall card stuff

  background color: 'black'
  rect layout: 'cut'
  rect layout: 'backOfCards'
  svg data: GameIcons.get('battle-gear').recolor(fg: 'fff', bg: '000', fg_opacity: 1, bg_opacity: 0).string, layout: 'emblemBack'
  ## output file stuff

  save_png prefix: 'ttec_BACK'
  #save_pdf trim: 37.5
end