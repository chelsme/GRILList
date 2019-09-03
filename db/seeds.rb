require 'json'

file = File.read('db/data.json')
data_hash = JSON.parse(file)

UserList.destroy_all
User.destroy_all
Recipe.destroy_all
Item.destroy_all
List.destroy_all

chels = User.create(name: "Chelsea", username: "chelsme", password: "cutedog")
kim = User.create(name: "Kim", username: "kimme", password: "cutepuppy")
trung = User.create(name: "Trung", username: "spark", password: "cutecat")

data_hash.each do |data|
  recipe = Recipe.create(name: data['name'],instructions: data['steps'].join(' '), img_url: data['imageURL'], user_id: rand(1..3))
  data['ingredients'].each do |item|
  item = Item.find_or_create_by(name: item['name'])
  RecipeItem.create(recipe_id: recipe.id, item_id: item.id, item_quantity: 1)
  end
end

grilling = List.create(name: "Grilling List")
groceries = List.create(name: "Grocery List")
lunch = List.create(name: "Lunch List")

UserList.create(user:chels, list:grilling)
UserList.create(user:trung, list:lunch)
UserList.create(user:kim, list:groceries)

List.all.each do |list|
    5.times do ListItem.create(list_id: list.id, item_id: rand(1..10), item_quantity: 1)
  end
end

