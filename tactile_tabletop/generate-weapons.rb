require 'squib'
require 'game_icons'

data = Squib.csv file: 'Action Cards - Weapons.csv'
#grabbing icons from https://game-icons.net/
#using gem game_icons to be able to load them


#width/height/dpi measurements provided by template from BoardGameMaker.com, see poker-size.pdf
Squib::Deck.new(dpi: 300, width: 822, height: 1122, cards: data['Weapon Name'].size, layout: 'layout.yml')  do

  ## overall card stuff

  background color: 'black'
  rect layout: 'cut'
  rect layout: 'safe'
  rect layout: 'topAbilityColorBox'
  rect layout: 'topAbilityColorBoxBorderCover'
  rect layout: 'bottomAbilityColorBox'
  rect layout: 'passivesColorBox'
  rect layout: 'requirementsColorBox'
  rect layout: 'requirementsColorBoxBorderCover'
  
  ## top ability stuff
  #rect layout: 'lineRightOfBubbles'
  rect layout: 'topTargetBubble'
  text str: data['Top Ability Target'], layout: 'topTarget'
  svg data: GameIcons.get('crosshair').recolor(fg: '777', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'topTargetIcon'
  
  rect layout: 'topDurationBubble'
  text str: data['Top Ability Duration'], layout: 'topDuration'
  svg data: GameIcons.get('stopwatch').recolor(fg: '777', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'topDurationIcon'

  
  #rect layout: 'topTitle'
  #rect layout: 'topVariables'
  #rect layout: 'topRules'
  text str: data['Top Ability Name'], layout: 'topTitle'
  text str: data['Top Ability Die Roll/Scaler'], layout: 'topVariables'
  text str: data['Top Ability Rules'], layout: 'topRules'
  svg file: data['Top Ability Following Card Action'].map {|t| "to_#{t.downcase}.svg" }, layout: 'topAfterAbilityLocation'

  ## bottom ability stuff
  
  rect layout: 'lineTopOfBottomAbility'
  rect layout: 'bottomTargetBubble'
  text str: data['Bottom Ability Target'], layout: 'bottomTarget'
  rect layout: 'bottomDurationBubble'
  text str: data['Bottom Ability Duration'], layout: 'bottomDuration'  
  #rect layout: 'bottomTitle'
  #rect layout: 'bottomRules'
  #rect layout: 'bottomVariables'
  text str: data['Bottom Ability Name'], layout: 'bottomTitle'
  text str: data['Bottom Ability Die Roll/Scaler'], layout: 'bottomVariables'
  svg data: GameIcons.get('crosshair').recolor(fg: '777', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomTargetIcon'
  
  text str: data['Bottom Ability Rules'], layout: 'bottomRules'
  svg file: data['Bottom Ability Following Card Action'].map {|t| "to_#{t.downcase}.svg" }, layout: 'bottomAfterAbilityLocation'
  svg data: GameIcons.get('stopwatch').recolor(fg: '777', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomDurationIcon'

  ## passives stuff
  
  rect layout: 'lineTopOfPassives'
  #rect layout: 'passivesTitle'
  #rect layout: 'passivesBody'
  text str: "Passives", layout: 'passivesTitle'
  text str: data['Passives'], layout: 'passivesBody'
  
  ## requirements stuff
  
  rect layout: 'lineTopOfRequirements'
  #rect layout: 'requirementsTitle'
  #rect layout: 'requirementsBody'
  text str: "Requirements", layout: 'requirementsTitle'
  text str: data['Requirements'], layout: 'requirementsBody'

  ## output file stuff

  save_png prefix: 'ttcc_'
  #save_pdf trim: 37.5
end

Squib::Deck.new(dpi: 300, width: 822, height: 1122, cards: 1, layout: 'layout.yml')  do

  ## overall card stuff

  background color: 'black'
  rect layout: 'cut'
  rect layout: 'backOfCards'
  svg data: GameIcons.get('rolling-dices').recolor(fg: 'fff', bg: '000', fg_opacity: 1, bg_opacity: 0).string, layout: 'diceBack'
  svg data: GameIcons.get('card-random').recolor(fg: 'fff', bg: '000', fg_opacity: 1, bg_opacity: 0).string, layout: 'cardBack'
  svg data: GameIcons.get('two-coins').recolor(fg: 'fff', bg: '000', fg_opacity: 1, bg_opacity: 0).string, layout: 'tokensBack'
  ## output file stuff

  save_png prefix: 'ttcc_BACK'
  #save_pdf trim: 37.5
end