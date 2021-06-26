require 'squib'
require 'game_icons'

data = Squib.csv file: 'Action Cards - CharacterCards.csv'


#width/height/dpi measurements provided by template from BoardGameMaker.com, see American-poker-size.pdf

Squib::Deck.new(dpi: 300, width: 816, height: 1110, cards: data['Top Ability Name'].size, layout: 'layout.yml')  do
  background color: 'white'
  rect layout: 'safe'
  rect layout: 'cut'
  
  text str: data['Top Ability Name'], layout: 'topTitle'
  rect layout: 'topTargetBox'
  #text str: data['Top Ability Target'], layout: 'topTarget'
  #text str: data['Top Ability Rules'], layout: 'topRules'

  #svg layout: data['discardTop']
  
  rect layout: 'topTitle'
  #rect layout: 'topRules'
  
  rect layout: 'lineTopOfBottomAbility'
  text str: data['Bottom Ability Name'], layout: 'bottomTitle'
  text str: data['Bottom Ability Rules'], layout: 'bottomRules'
  png layout: data['discardBottom']
  
  rect layout: 'lineTopOfPassives'
  text str: "Passives", layout: 'passivesTitle'
  text str: data['Passives'], layout: 'passivesBody'
  
  rect layout: 'lineTopOfRequirements'
  text str: "Requirements", layout: 'requirementsTitle'
  text str: data['Requirements'], layout: 'requirementsBody'
  
  save_png prefix: 'ttcc_'
  #save_pdf trim: 37.5
end