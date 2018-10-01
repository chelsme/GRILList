# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserList.destroy_all
User.destroy_all
Recipe.destroy_all
Item.destroy_all
List.destroy_all

chels = User.create(name: "Chelsea", username: "chelsme", password: "cutedog")
kim = User.create(name: "Kim", username: "kimme", password: "cutepuppy")
trung = User.create(name: "Trung", username: "trungme", password: "cutecat")

steak = Recipe.create(name: "Steak")
burger = Recipe.create(name: "Burger")
smore = Recipe.create(name: "S'more")

ribeye = Item.create(name: "ribeye")
butter = Item.create(name: "butter")
herbmix = Item.create(name: "herb mix")
tomato = Item.create(name: "tomato")
lettuce = Item.create(name: "lettuce")
bun = Item.create(name: "bun")
cheese = Item.create(name: "cheese")
hamburger = Item.create(name: "hamburger patty")
graham = Item.create(name: "graham cracker")
chocolate = Item.create(name: "chocolate")
marshmallow = Item.create(name: "marshmallow")

grilling = List.create(name: "Grilling List")
groceries = List.create(name: "Grocery List")

UserList.create(user:chels, list:grilling)

RecipeItem.create(recipe:burger, item:bun, item_quantity:2)
RecipeItem.create(recipe:burger, item:tomato, item_quantity:1)
RecipeItem.create(recipe:burger, item:cheese, item_quantity:2)
RecipeItem.create(recipe:burger, item:hamburger, item_quantity:3)
RecipeItem.create(recipe:burger, item:lettuce, item_quantity:1)

ListItem.create(list:grilling, item: ribeye, item_quantity: 3)
ListItem.create(list:grilling, item: butter, item_quantity: 3)
ListItem.create(list:grilling, item: herbmix, item_quantity: 3)
ListItem.create(list:grilling, item: tomato, item_quantity: 3)
ListItem.create(list:grilling, item: lettuce, item_quantity: 3)
ListItem.create(list:grilling, item: bun, item_quantity: 3)
ListItem.create(list:grilling, item: cheese, item_quantity: 3)
ListItem.create(list:grilling, item: hamburger, item_quantity: 3)
ListItem.create(list:grilling, item: graham, item_quantity: 3)
ListItem.create(list:grilling, item: chocolate, item_quantity: 3)
ListItem.create(list:grilling, item: marshmallow, item_quantity: 3)
