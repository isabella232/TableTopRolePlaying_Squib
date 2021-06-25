require 'squib'

data = Squib.csv file: 'testCardInput.csv'

Squib::Deck.new cards: data['topAbilityName'].size, layout: 'layout.yml' do
  background color: 'white'
  rect layout: 'safe'
  rect layout: 'cut'
  text str: data['topAbilityName'], layout: 'title1'
  text str: data['topAbility'], layout: 'desc1'
  
  text str: data['bottomAbilityName'], layout: 'title2'
  text str: data['bottomAbility'], layout: 'desc2'
  
  save_png prefix: 'ttcc_'
  save_pdf trim: 37.5
end