require 'bundler/setup'
# Bundler.require(:default)
require 'faker'
# require 'pry'


puts Faker::Name.name

puts Faker::HarryPotter.quote #=> "I solemnly swear that I am up to no good."
puts Faker::HarryPotter.spell


return
Faker::WorldCup.team #=> "South Korea"

Faker::WorldCup.stadium #=> "Ekaterinburg Arena"

Faker::WorldCup.city #=> "Saint Petersburg"

Faker::WorldCup.group #=> "Egypt"

Faker::WorldCup.group('group_A') #=> "Saudi Arabia"

Faker::WorldCup.roster #=> "Héctor Cúper"

Faker::WorldCup.roster('Russia', 'coach') #=> "Stanislav Cherchesov"


Faker::HowIMetYourMother.quote #=> "Whenever I’m sad, I stop being sad and be awesome instead."

Faker::GameOfThrones.quote #=> "Never forget who you are. The rest of the world won't. Wear it like an armor and it can never be used against you."
