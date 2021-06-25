require 'squib'

data = Squib.csv file: 'testCardInput.csv'

Squib::Deck.new cards: data['Top Ability Name'].size, layout: 'layout.yml' do
  background color: 'white'
  rect layout: 'safe'
  rect layout: 'cut'
  text str: data['Top Ability Name'], layout: 'title1'
  text str: data['Top Ability Rules'], layout: 'desc1'
  
  text str: data['Bottom Ability Name'], layout: 'title2'
  text str: data['Bottom Ability Rules'], layout: 'desc2'
  
  save_png prefix: 'ttcc_'
  save_pdf trim: 37.5
end