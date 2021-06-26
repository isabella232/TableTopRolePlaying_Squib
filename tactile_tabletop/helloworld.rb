require 'squib'

data = Squib.csv file: 'Action Cards - CharacterCards.csv'

Squib::Deck.new cards: data['Top Ability Name'].size, layout: 'layout.yml' do
  background color: 'white'
  rect layout: 'safe'
  rect layout: 'cut'
  line layout: 'line'
  
  text str: data['Top Ability Name'], layout: 'topTitle'
  text str: data['Top Ability Rules'], layout: 'topRules'
  png layout: data['discardTop']
  
  text str: data['Bottom Ability Name'], layout: 'bottomTitle'
  text str: data['Bottom Ability Rules'], layout: 'bottomRules'
  png layout: data['discardBottom']
  
  save_png prefix: 'ttcc_'
  save_pdf trim: 37.5
end