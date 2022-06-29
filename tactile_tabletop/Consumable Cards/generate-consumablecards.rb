require 'squib'
require 'game_icons'


if ARGV[0].nil?
  data = Squib.csv file: 'Tactile_Tabletop_Data-Consumables.csv'
else
  data = Squib.csv file: ARGV[0]
end

#data = Squib.csv file: 'Tactile_Tabletop_Data-Level_2_CC.csv'
#grabbing icons from https://game-icons.net/
#using gem game_icons to be able to load them


#width/height/dpi measurements provided by template from BoardGameMaker.com, see poker-size.pdf
Squib::Deck.new(dpi: 300, width: 750, height: 1050, cards: data['Consumable Name'].size, layout: 'consumablecardlayout.yml')  do

  ## overall card stuff

  background color: 'white'
  rect layout: 'cut'
  rect layout: 'safe'
  # rect layout: 'ttitle'
  # rect layout: 'vvariables'
  # rect layout: 'rrules'
  # rect layout: 'ccost'
  # rect layout: 'ccostTitle'
  

  text str: data['Consumable Name'], layout: 'ttitle'
  text str: data['Consumable Variables'], layout: 'vvariables'
  text str: data['Consumable Rules'], layout: 'rrules'
  text str: data['Consumable Cost'], layout: 'ccost'
  text str: "Cost:", layout: 'ccostTitle'

  ## output file stuff

  save_png prefix: 'ttconsc_'
  #save_pdf trim: 37.5
end

Squib::Deck.new(dpi: 300, width: 750, height: 1050, cards: 1, layout: 'consumablecardlayout.yml')  do

  ## overall card stuff

  background color: 'white'
  rect layout: 'cut'
  rect layout: 'backOfCards'
  svg data: GameIcons.get('rolling-dices').recolor(fg: 'fff', bg: '000', fg_opacity: 1, bg_opacity: 0).string, layout: 'diceBack'
  svg data: GameIcons.get('card-random').recolor(fg: 'fff', bg: '000', fg_opacity: 1, bg_opacity: 0).string, layout: 'cardBack'
  svg data: GameIcons.get('two-coins').recolor(fg: 'fff', bg: '000', fg_opacity: 1, bg_opacity: 0).string, layout: 'tokensBack'
  ## output file stuff

  save_png prefix: 'ttcc_BACK'
  #save_pdf trim: 37.5
end