# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
require 'faker'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = open(url).read
data = JSON.parse(ingredients)
data['drinks'].each do |element|
  ingredient = Ingredient.new(
    name: element['strIngredient1']
)
  ingredient.save!
end

5.times do
  cocktail = Cocktail.new(
    name: Faker::TvShows::GameOfThrones.character,
    picture: "https://source.unsplash.com/random/?cocktails"
  )
  cocktail.save!

  Ingredient.all.sample(3).each do |ingredient|
    dose = Dose.new(
      description: Faker::TvShows::GameOfThrones.character,
      ingredient: ingredient,
      cocktail: cocktail
    )
    dose.save!
  end
end
