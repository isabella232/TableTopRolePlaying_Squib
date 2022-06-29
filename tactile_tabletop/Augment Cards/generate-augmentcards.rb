require 'squib'
require 'game_icons'


if ARGV[0].nil?
  data = Squib.csv file: 'Tactile_Tabletop_Data-Augmentss.csv'
else
  data = Squib.csv file: ARGV[0]
end

#data = Squib.csv file: 'Tactile_Tabletop_Data-Level_2_CC.csv'
#grabbing icons from https://game-icons.net/
#using gem game_icons to be able to load them


#width/height/dpi measurements provided by template from BoardGameMaker.com, see poker-size.pdf
Squib::Deck.new(dpi: 300, width: 750, height: 1050, cards: data['Name'].size, layout: 'augmentcardlayout.yml')  do

  ## overall card stuff

  background color: 'white'
  rect layout: 'cut'
  rect layout: 'safe'
  # rect layout: 'ttitle'
  # rect layout: 'vvariables'
  # rect layout: 'rrules'
  # rect layout: 'remove'
  # rect layout: 'removeTitle'
  

  text str: data['Name'], layout: 'ttitle'
  text str: data['Variables'], layout: 'vvariables'
  text str: data['Rules'], layout: 'rrules'
  text str: data['Conditions to Remove'], layout: 'remove'
  text str: "Conditions to Remove:", layout: 'removeTitle'

  ## output file stuff

  save_png prefix: 'ttac_'
  #save_pdf trim: 37.5
end

Squib::Deck.new(dpi: 300, width: 750, height: 1050, cards: 1, layout: 'augmentcardlayout.yml')  do

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