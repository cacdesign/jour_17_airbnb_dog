# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require 'faker'


# - Je crée mes villes
10.times do |index|
	c = City.create(name: Faker::Address.city)
	p "La ville #{c.name} a été créée"
end

# - Je crée mes dogs 
10.times do |index|
	dog = Dog.create(name: Faker::Name.name, city: City.all.sample)
	p "Le chien #{dog.name} a été créé dans la ville #{dog.city.name}"
end

# - Je crée mes dogsitters
10.times do |index|
	ds = Dogsitter.create(name: Faker::Name.name, city: City.all.sample)
	p "Le dogsitter #{ds.name} a été créé dans la ville #{ds.city.name}"
end

# - Je crée mes promenades (table de jointure Spécialités/Docteurs)
10.times do |index|
	s = Stroll.create(date: Faker::Date.between(20.days.ago, Date.today), dog: Dog.all.sample, dogsitter: Dogsitter.all.sample)
	p "La promenade aura lieu le #{s.date} entre le chien #{s.dog.name} et le dogsitter #{s.dogsitter.name}"
end
