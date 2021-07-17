require 'squib'
require 'game_icons'

data = Squib.csv file: 'Action Cards - Weapons.csv'
#grabbing icons from https://game-icons.net/
#using gem game_icons to be able to load them


#width/height/dpi measurements provided by template from BoardGameMaker.com, see poker-size.pdf
Squib::Deck.new(dpi: 300, width: 820, height: 820, cards: data['Weapon Name'].size, layout: 'weaponcardlayout.yml')  do

  ## overall card stuff

  background color: 'black'
  rect layout: 'cut'
  rect layout: 'safe'
  
  ## top ability stuff
  text str: data['Weapon Name'], layout: 'WeaponTitle'
  
  text str: "Attack Die:", layout: 'AttackTitle'
  svg file: data['Attack Die 1'].map {|t| "#{t.downcase}.svg" }, layout: 'AttackDie1'  
  svg file: data['Attack Die 2'].map {|t| "#{t.downcase}.svg" }, layout: 'AttackDie2'
  
  text str: "Defense Die:", layout: 'DefenseTitle'
  svg file: data['Defense Die'].map {|t| "#{t.downcase}.svg" }, layout: 'DefenseDie'
  
  text str: "Range:", layout: 'RangeTitle'
  text str: data['Range'], layout: 'RangeValue'
  
  text str: "Requirements:", layout: 'RequirementsTitle'
  svg file: data['Requirement'].map {|t| "#{t.downcase}.svg" }, layout: 'RequirementsValue'
  
  text str: "Notes:", layout: 'NotesTitle'
  rect layout: 'NotesTitle'
  text str: data['Extra Notes'], layout: 'NotesValue'
  rect layout: 'NotesValue'
  
  # rect layout: 'topDurationBubble'
  # text str: data['Top Ability Duration'], layout: 'topDuration'
  # svg data: GameIcons.get('stopwatch').recolor(fg: '777', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'topDurationIcon'

  
  # #rect layout: 'topTitle'
  # #rect layout: 'topVariables'
  # #rect layout: 'topRules'
  # text str: data['Top Ability Name'], layout: 'topTitle'
  # text str: data['Top Ability Die Roll/Scaler'], layout: 'topVariables'
  # text str: data['Top Ability Rules'], layout: 'topRules'
  # svg file: data['Top Ability Following Card Action'].map {|t| "to_#{t.downcase}.svg" }, layout: 'topAfterAbilityLocation'

  # ## bottom ability stuff
  
  # rect layout: 'lineTopOfBottomAbility'
  # rect layout: 'bottomTargetBubble'
  # text str: data['Bottom Ability Target'], layout: 'bottomTarget'
  # rect layout: 'bottomDurationBubble'
  # text str: data['Bottom Ability Duration'], layout: 'bottomDuration'  
  # #rect layout: 'bottomTitle'
  # #rect layout: 'bottomRules'
  # #rect layout: 'bottomVariables'
  # text str: data['Bottom Ability Name'], layout: 'bottomTitle'
  # text str: data['Bottom Ability Die Roll/Scaler'], layout: 'bottomVariables'
  # svg data: GameIcons.get('crosshair').recolor(fg: '777', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomTargetIcon'
  
  # text str: data['Bottom Ability Rules'], layout: 'bottomRules'
  # svg file: data['Bottom Ability Following Card Action'].map {|t| "to_#{t.downcase}.svg" }, layout: 'bottomAfterAbilityLocation'
  # svg data: GameIcons.get('stopwatch').recolor(fg: '777', bg: '000', fg_opacity: 0.6, bg_opacity: 0).string, layout: 'bottomDurationIcon'

  # ## passives stuff
  
  # rect layout: 'lineTopOfPassives'
  # #rect layout: 'passivesTitle'
  # #rect layout: 'passivesBody'
  # text str: "Passives", layout: 'passivesTitle'
  # text str: data['Passives'], layout: 'passivesBody'
  
  # ## requirements stuff
  
  # rect layout: 'lineTopOfRequirements'
  # #rect layout: 'requirementsTitle'
  # #rect layout: 'requirementsBody'
  # text str: "Requirements", layout: 'requirementsTitle'
  # text str: data['Requirements'], layout: 'requirementsBody'

  # ## output file stuff

  save_png prefix: 'ttwc_'
  #save_pdf trim: 37.5
end

Squib::Deck.new(dpi: 300, width: 820, height: 820, cards: 1, layout: 'weaponcardlayout.yml')  do

  ## overall card stuff

  background color: 'black'
  rect layout: 'cut'
  rect layout: 'backOfCards'
  svg data: GameIcons.get('swords-emblem').recolor(fg: 'fff', bg: '000', fg_opacity: 1, bg_opacity: 0).string, layout: 'emblemBack'
  ## output file stuff

  save_png prefix: 'ttwc_BACK'
  #save_pdf trim: 37.5
end