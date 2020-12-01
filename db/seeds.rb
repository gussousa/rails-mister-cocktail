# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "--------------------------------------"
puts "Creating ingredients"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)
ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
  puts "#{ingredient['strIngredient1']} added to DB}"
end

puts "--------------------------------------"
puts "Creating cocktails"

mojito = Cocktail.create(name: "Mojito")
puts "#{mojito.name} added to DB"
blood_mary = Cocktail.create(name: "Blood Mary")
puts "#{blood_mary.name} added to DB"
sex_on_the_beach = Cocktail.create(name: "Sex on the Beach")
puts "#{sex_on_the_beach.name} added to DB"
margarita = Cocktail.create(name: "Margarita")
puts "#{margarita.name} added to DB"
pina_colada = Cocktail.create(name: "Piña Colada")
puts "#{pina_colada.name} added to DB"