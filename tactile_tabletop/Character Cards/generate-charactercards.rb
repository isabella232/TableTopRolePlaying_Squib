#import squib stuff. requires Ruby to be installed, and for 'gem install squib' and 'gem install game_icons'
require 'squib'
#icons are grabbed from https://game-icons.net/
require 'game_icons'

#this file is designed to be given the name of a .csv file to parse. it can handle a default value if none are provided, for fast prototyping
if ARGV[0].nil?
  data = Squib.csv file: 'Tactile_Tabletop_Data-Level_1_CC.csv'
else
  data = Squib.csv file: ARGV[0]
end

#width/height/dpi measurements provided by template from BoardGameMaker.com, see poker-size.pdf included in this directory
Squib::Deck.new(dpi: 300, width: 750, height: 1050, cards: data['Top Ability Name'].size, layout: 'charactercardlayout.yml')  do

  ## overall card stuff

  background color: 'white'
  #the rectangle border where the poker card should be cut (see poker-size.pdf)
  rect layout: 'cut'
  
  # #aaa is the same as the border, so it's effectively zero'd out
  perceptionBorderColor = data['Perception Requirements'].map {|c| c > 0 ? '#00ffff' : '#000'}
  vigorBorderColor = data['Vigor Requirements'].map {|c| c > 0 ? '#008000' : '#000'}
  finesseBorderColor = data['Finesse Requirements'].map {|c| c > 0 ? '#ffc0cb' : '#000'}
  knowledgeBorderColor = data['Knowledge Requirements'].map {|c| c > 0 ? '#0000ff' : '#000'}
  strengthBorderColor = data['Strength Requirements'].map {|c| c > 0 ? '#ff0000' : '#000'}
  spiritualityBorderColor = data['Spirituality Requirements'].map {|c| c > 0 ? '#800080' : '#000'}
  charismaBorderColor = data['Charisma Requirements'].map {|c| c > 0 ? '#ffd700' : '#000'}
  craftmanshipBorderColor = data['Craftmanship Requirements'].map {|c| c > 0 ? '#ffffff' : '#000'}
  
  rect x: 750, y: 675, width: 1000, height: 30, angle: 10, fill_color: perceptionBorderColor, stroke_width: 0
  rect x: 750, y: 705, width: 1000, height: 30, angle: 10, fill_color: vigorBorderColor, stroke_width: 0
  rect x: 750, y: 735, width: 1000, height: 30, angle: 10, fill_color: finesseBorderColor, stroke_width: 0
  rect x: 750, y: 765, width: 1000, height: 30, angle: 10, fill_color: knowledgeBorderColor, stroke_width: 0
  rect x: 750, y: 795, width: 1000, height: 30, angle: 10, fill_color: strengthBorderColor, stroke_width: 0
  rect x: 750, y: 825, width: 1000, height: 30, angle: 10, fill_color: spiritualityBorderColor, stroke_width: 0
  rect x: 750, y: 855, width: 1000, height: 30, angle: 10, fill_color: charismaBorderColor, stroke_width: 0
  rect x: 750, y: 885, width: 1000, height: 30, angle: 10, fill_color: craftmanshipBorderColor, stroke_width: 0
  
  #the rectangle border where the poker card should be guaranteed to not be cut (see poker-size.pdf)
  #not actually useful to be displayed unless debugging, but lots of other items are based off of where the safe edges are
  #rect layout: 'safe'
  #this is the background color for the top ability
  rect layout: 'topAbilityColorBox'
  #I think this just makes the bottom edge with the horizontal bar look a bit cleaner
  rect layout: 'topAbilityColorBoxBorderCover'
  #this is the background color for the bottom ability
  rect layout: 'bottomAbilityColorBox'
  #background color for the passives section, below the bottom ability
  rect layout: 'passivesColorBox'
  #background color for requirements section, below passives
  rect layout: 'requirementsColorBox'
  #again, cleaning up the edges around a box
  rect layout: 'requirementsColorBoxBorderCover'
  
  ## top ability stuff
  
  #top ability has a few bubbles, summarizing ability data
  #this is the bubble (with a 1 pixel black border, or 'stroke', to stand out) for targets, and it has its own colors
  rect layout: 'topTargetBubble'
  #fill in the bubble with text (has to be concise). Target can be Ally, ENemy, Self, Plant/Animal, area, Target (generic and flexible)
  text str: data['Top Ability Target'], layout: 'topTarget'
  #put in a background image, a little faded, of a crosshair
  svg data: GameIcons.get('crosshair').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'topTargetIcon'
  
  #similar to above, but for the Range (close, controlled by weapon, controlled by influence)
  rect layout: 'topRangeBubble'
  text str: data['Top Weapon Or Influence'], layout: 'topRange'
  text str: data['Top Ability Target'], layout: 'topTarget'
  svg data: GameIcons.get('binoculars').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'topRangeIcon'
  
  #similar to above, but for duration (Instant, # rnds, Day,)
  rect layout: 'topDurationBubble'
  text str: data['Top Ability Duration'], layout: 'topDuration'
  svg data: GameIcons.get('stopwatch').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'topDurationIcon'

  #similar to above, but for what happens to the card as a result of using this action (hand, discard, exhaust)
  rect layout: 'topResultBubble'
  text str: data['Top Ability Following Card Action'], layout: 'topResult'
  svg data: GameIcons.get('arrow-dunk').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'topResultIcon'

  #now that we've handled bubbles, we need to handle the text of the ability itself
  #these rectangles are good for debugging around resizing, but otherwise shouldn't be made visible
  #rect layout: 'topTitle'
  #rect layout: 'topVariables'
  #rect layout: 'topRules'
  #get the top ability name and put it in the top 'Title' section
  text str: data['Top Ability Name'], layout: 'topTitle'
  #get the shorthand stuff and place it in the 'variables' section (x = level, y = influence, etc.)
  text str: data['Top Ability Die Roll/Scaler'], layout: 'topVariables'
  #get the explanation for the ability and put it in the 'rules' section
  text str: data['Top Ability Rules'], layout: 'topRules'
  
  #create a horizontal line separating the top and bottom abilities
  rect layout: 'lineTopOfBottomAbility'

  
  ## bottom ability stuff
  #these are the same as the top ability stuff, but based off a higher y value (so are lower on the card)
  
  #bubbles
  rect layout: 'bottomTargetBubble'
  text str: data['Bottom Ability Target'], layout: 'bottomTarget'
  svg data: GameIcons.get('crosshair').recolor(fg: '777', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomTargetIcon'

  rect layout: 'bottomRangeBubble'
  text str: data['Bottom Weapon Or Influence'], layout: 'bottomRange'
  svg data: GameIcons.get('binoculars').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomRangeIcon'
  
  rect layout: 'bottomDurationBubble'
  text str: data['Bottom Ability Duration'], layout: 'bottomDuration'  
  svg data: GameIcons.get('stopwatch').recolor(fg: '777', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomDurationIcon'

  rect layout: 'bottomResultBubble'
  text str: data['Bottom Ability Following Card Action'], layout: 'bottomResult'
  svg data: GameIcons.get('arrow-dunk').recolor(fg: 'aaa', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomResultIcon'

  #ability specifics
  #rect layout: 'bottomTitle'
  #rect layout: 'bottomRules'
  #rect layout: 'bottomVariables'
  text str: data['Bottom Ability Name'], layout: 'bottomTitle'
  text str: data['Bottom Ability Die Roll/Scaler'], layout: 'bottomVariables'
  text str: data['Bottom Ability Rules'], layout: 'bottomRules'

  ## passives stuff
  #similar to abilities section but for passives
  
  #create a horizontal line separating the bottom ability and passives section
  rect layout: 'lineTopOfPassives'
  
  #rect layout: 'passivesTitle'
  #rect layout: 'passivesBody'
  text str: "Passive", layout: 'passivesTitle'
  #passives body is usually 2 level points
  text str: data['Passives'], layout: 'passivesBody'

  ## Tier stuff
  
  #add a vertical line to the right of the Passives section, where this tier stuff wil be
  rect layout: 'verticalLine'
  #rect layout: 'tierTitle'
  #rect layout: 'tierBody'
  text str: "Tier:", layout: 'tierTitle'
  #tier is a shorthand for how many stat points are required, indicates how powerful they are
  #0 state requirements are tier 1, 4 state requirements are tier 2, and 7 state requirements are tier 3
  text str: data['Tier'], layout: 'tierBody'

  ## requirements stuff
  
  #add a horizontal line to separate passives and requirements
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


  #requirements are any number of stat requirements (needing 4 strength, or 2 perception and 2 knowledge, etc.)
  text str: requirementsText, layout: 'requirementsBody'

  
  #to keep track of cards in a tier, we create a circle and put in a number of its index from the .csv
  #the specific number holds no meaning, we can later swap the order of cards if we need to, right now it's jus the order that it is in the .csv
  rect layout: 'cardNumberCircle'
  text str: data['ID'], layout: 'cardNumber'

  ## output file stuff

  save_png prefix: 'ttcc_'
  #save_pdf trim: 37.5
  save_sheet sprue: 'letter_poker_card_9up.yml'
end

#this is for creading the back of the card, right now a single image
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