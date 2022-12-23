require 'squib'
require 'game_icons'


if ARGV[0].nil?
  data = Squib.csv file: 'Tactile_Tabletop_Data-Level_1_CC.csv'
else
  data = Squib.csv file: ARGV[0]
end

#data = Squib.csv file: 'Tactile_Tabletop_Data-Level_2_CC.csv'
#grabbing icons from https://game-icons.net/
#using gem game_icons to be able to load them


#width/height/dpi measurements provided by template from BoardGameMaker.com, see poker-size.pdf
#Squib::Deck.new(dpi: 300, width: 822, height: 1122, cards: data['Top Ability Name'].size, layout: 'charactercardlayout.yml')  do
Squib::Deck.new(dpi: 300, width: 750, height: 1050, cards: data['Top Ability Name'].size, layout: 'charactercardlayout.yml')  do

  ## overall card stuff

  background color: 'white'
  rect layout: 'cut'
  
  # #aaa is the same as the border, so it's effectively zero'd out
  perceptionBorderColor = data['Perception Requirements'].map {|c| c > 0 ? '#00ffff' : '#aaa'}
  vigorBorderColor = data['Vigor Requirements'].map {|c| c > 0 ? '#008000' : '#aaa'}
  finesseBorderColor = data['Finesse Requirements'].map {|c| c > 0 ? '#ffc0cb' : '#aaa'}
  knowledgeBorderColor = data['Knowledge Requirements'].map {|c| c > 0 ? '#0000ff' : '#aaa'}
  strengthBorderColor = data['Strength Requirements'].map {|c| c > 0 ? '#ff0000' : '#aaa'}
  spiritualityBorderColor = data['Spirituality Requirements'].map {|c| c > 0 ? '#800080' : '#aaa'}
  charismaBorderColor = data['Charisma Requirements'].map {|c| c > 0 ? '#ffd700' : '#aaa'}
  craftmanshipBorderColor = data['Craftmanship Requirements'].map {|c| c > 0 ? '#000000' : '#aaa'}
  
  rect x: 750, y: 675, width: 1000, height: 30, angle: 10, fill_color: perceptionBorderColor, stroke_width: 0
  rect x: 750, y: 705, width: 1000, height: 30, angle: 10, fill_color: vigorBorderColor, stroke_width: 0
  rect x: 750, y: 735, width: 1000, height: 30, angle: 10, fill_color: finesseBorderColor, stroke_width: 0
  rect x: 750, y: 765, width: 1000, height: 30, angle: 10, fill_color: knowledgeBorderColor, stroke_width: 0
  rect x: 750, y: 795, width: 1000, height: 30, angle: 10, fill_color: strengthBorderColor, stroke_width: 0
  rect x: 750, y: 825, width: 1000, height: 30, angle: 10, fill_color: spiritualityBorderColor, stroke_width: 0
  rect x: 750, y: 855, width: 1000, height: 30, angle: 10, fill_color: charismaBorderColor, stroke_width: 0
  rect x: 750, y: 885, width: 1000, height: 30, angle: 10, fill_color: craftmanshipBorderColor, stroke_width: 0
  
  #rect layout: 'safe'
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
  svg data: GameIcons.get('crosshair').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'topTargetIcon'
  
  rect layout: 'topRangeBubble'
  #svg file: data['Top Weapon Or Influence'].map {|t| "#{t.downcase}.svg" }, layout: 'topRange'
  text str: data['Top Weapon Or Influence'], layout: 'topRange'
  text str: data['Top Ability Target'], layout: 'topTarget'
  svg data: GameIcons.get('binoculars').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'topRangeIcon'
  
  rect layout: 'topDurationBubble'
  text str: data['Top Ability Duration'], layout: 'topDuration'
  svg data: GameIcons.get('stopwatch').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'topDurationIcon'

  rect layout: 'topResultBubble'
  text str: data['Top Ability Following Card Action'], layout: 'topResult'
  svg data: GameIcons.get('arrow-dunk').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'topResultIcon'

  
  #rect layout: 'topTitle'
  #rect layout: 'topVariables'
  #rect layout: 'topRules'
  text str: data['Top Ability Name'], layout: 'topTitle'
  #svg file: data['Top Weapon Or Influence'].map {|t| "#{t.downcase}.svg" }, layout: 'topWeaponOrInfluence'
  text str: data['Top Ability Die Roll/Scaler'], layout: 'topVariables'
  text str: data['Top Ability Rules'], layout: 'topRules'
  ## bottom ability stuff
  
  rect layout: 'lineTopOfBottomAbility'
  rect layout: 'bottomTargetBubble'
  text str: data['Bottom Ability Target'], layout: 'bottomTarget'
  
  rect layout: 'bottomRangeBubble'
  #svg file: data['Bottom Weapon Or Influence'].map {|t| "#{t.downcase}.svg" }, layout: 'bottomRange'
  text str: data['Bottom Weapon Or Influence'], layout: 'bottomRange'
  text str: data['Bottom Ability Target'], layout: 'bottomTarget'
  svg data: GameIcons.get('binoculars').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomRangeIcon'
  
  rect layout: 'bottomDurationBubble'
  text str: data['Bottom Ability Duration'], layout: 'bottomDuration'  

  rect layout: 'bottomResultBubble'
  text str: data['Bottom Ability Following Card Action'], layout: 'bottomResult'
  svg data: GameIcons.get('arrow-dunk').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomResultIcon'

  
  #rect layout: 'bottomTitle'
  #rect layout: 'bottomRules'
  #rect layout: 'bottomVariables'
  text str: data['Bottom Ability Name'], layout: 'bottomTitle'
  #svg file: data['Bottom Weapon Or Influence'].map {|t| "#{t.downcase}.svg" }, layout: 'bottomWeaponOrInfluence'
  text str: data['Bottom Ability Die Roll/Scaler'], layout: 'bottomVariables'
  svg data: GameIcons.get('crosshair').recolor(fg: '777', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomTargetIcon'
  
  text str: data['Bottom Ability Rules'], layout: 'bottomRules'
  svg data: GameIcons.get('stopwatch').recolor(fg: '777', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomDurationIcon'

  ## passives stuff
  
  rect layout: 'lineTopOfPassives'
  #rect layout: 'passivesTitle'
  #rect layout: 'passivesBody'
  text str: "Passives", layout: 'passivesTitle'
  text str: data['Passives'], layout: 'passivesBody'
  
  rect layout: 'verticalLine'
  #rect layout: 'tierTitle'
  #rect layout: 'tierBody'
  text str: "Tier:", layout: 'tierTitle'
  text str: data['Tier'], layout: 'tierBody'

  ## requirements stuff
  
  rect layout: 'lineTopOfRequirements'
  #rect layout: 'requirementsTitle'
  #rect layout: 'requirementsBody'
  text str: "Requirements", layout: 'requirementsTitle'
  
  
  #create empty array of the right size
  requirementsText = data['Perception Requirements'].map {|val| " "}
  #create arrays of the same size, either empty or with the info for their stats specified
  perceptionRequirementsText = data['Perception Requirements'].map {|val| val > 0 ? val.to_s + " Per " : ""}
  vigorRequirementsText = data['Vigor Requirements'].map {|val| val > 0 ? val.to_s + " Vig " : ""}
  finesseRequirementsText = data['Finesse Requirements'].map {|val| val > 0 ? val.to_s + " Fin " : ""}
  knowledgeRequirementsText = data['Knowledge Requirements'].map {|val| val > 0 ? val.to_s + " Kno " : ""}
  strengthRequirementsText = data['Strength Requirements'].map {|val| val > 0 ? val.to_s + " Str " : ""}
  spiritualityRequirementsText = data['Spirituality Requirements'].map {|val| val > 0 ? val.to_s + " Spi " : ""}
  charismaRequirementsText = data['Charisma Requirements'].map {|val| val > 0 ? val.to_s + " Cha " : ""}
  craftmanshipRequirementsText = data['Craftmanship Requirements'].map {|val| val > 0 ? val.to_s + " Cra " : ""}
  
  #append all the strings together across the arrays
  #zip the arrays together, so each entry becomes a sub array of all the text
  requirementsText = requirementsText.zip(perceptionRequirementsText, vigorRequirementsText, finesseRequirementsText, knowledgeRequirementsText, strengthRequirementsText, spiritualityRequirementsText, charismaRequirementsText, craftmanshipRequirementsText)
  #turn the sub arrays into singular strings
  requirementsText = requirementsText.map {|subArray| subArray * ""}


#create a third array, which combines the contents of 2 others?
#use map to cmobine two arrays...  
#product will combine entries together into sub arrays... need to ignore most of the combinations,  and would need to flatten those that I'd need to concatenate the strings
#zip?
  
  text str: requirementsText, layout: 'requirementsBody'
  
  rect layout: 'cardNumberCircle'
  text str: data['ID'], layout: 'cardNumber'

  ## output file stuff

  save_png prefix: 'ttcc_'
  #save_pdf trim: 37.5
end

Squib::Deck.new(dpi: 300, width: 750, height: 1050, cards: 1, layout: 'charactercardlayout.yml')  do

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