require 'squib'

data = Squib.csv file: 'Action Cards - CharacterCards.csv'

Squib::Deck.new cards: data['Top Ability Name'].size, layout: 'layout.yml' do
  background color: 'white'
  rect layout: 'safe'
  rect layout: 'cut'
  
  text str: data['Top Ability Name'], layout: 'topTitle'
  rect layout: 'topTargetBox'
  text str: data['Top Ability Target'], layout: 'topTarget'
  text str: data['Top Ability Rules'], layout: 'topRules'
  png layout: data['discardTop']
  
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