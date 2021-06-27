require 'squib'
require 'game_icons'

data = Squib.csv file: 'Action Cards - CharacterCards.csv'
#grabbing icons from https://game-icons.net/
#using gem game_icons to be able to load them


#width/height/dpi measurements provided by template from BoardGameMaker.com, see American-poker-size.pdf
Squib::Deck.new(dpi: 300, width: 816, height: 1110, cards: data['Top Ability Name'].size, layout: 'layout.yml')  do

  ## overall card stuff

  background color: 'white'
  rect layout: 'safe'
  rect layout: 'cut'
  
  ## top ability stuff
  #rect layout: 'lineRightOfBubbles'
  text str: data['Top Ability Target'], layout: 'topTarget'
  rect layout: 'topTargetBox'
  
  #rect layout: 'topTitle'
  #rect layout: 'topRules'
  text str: data['Top Ability Name'], layout: 'topTitle'
  text str: data['Top Ability Rules'], layout: 'topRules'
  svg file: data['Top Ability Following Card Action'].map {|t| "to_#{t.downcase}.svg" }, layout: 'topAfterAbilityLocation'

  ## bottom ability stuff
  
  rect layout: 'lineTopOfBottomAbility'
  #rect layout: 'bottomTitle'
  #rect layout: 'bottomRules'
  text str: data['Bottom Ability Name'], layout: 'bottomTitle'
  text str: data['Bottom Ability Rules'], layout: 'bottomRules'
  svg file: data['Bottom Ability Following Card Action'].map {|t| "to_#{t.downcase}.svg" }, layout: 'bottomAfterAbilityLocation'

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

  ## output file stuff stuff

  save_png prefix: 'ttcc_'
  #save_pdf trim: 37.5
end