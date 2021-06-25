require 'squib'

data = Squib.csv file: 'testCardInput.csv'

Squib::Deck.new cards: data['Top Ability Name'].size, layout: 'layout.yml' do
  background color: 'white'
  rect layout: 'safe'
  rect layout: 'cut'
  text str: data['Top Ability Name'], layout: 'topTitle'
  text str: data['Top Ability Rules'], layout: 'topRules'
  
  text str: data['Bottom Ability Name'], layout: 'bottomTitle'
  text str: data['Bottom Ability Rules'], layout: 'bottomRules'
  
  save_png prefix: 'ttcc_'
  save_pdf trim: 37.5
end