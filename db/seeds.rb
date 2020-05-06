User.all.each do |u|
    u.destroy
end
Restaurant.all.each do |u|
    u.destroy
end
Item.all.each do |u|
    u.destroy
end
Order.all.each do |u|
    u.destroy
end
OrderItem.all.each do |u|
    u.destroy
end



users = [
    {name: "toni",email: "toni@example.com", password:"toni"},
    {name: "test",email: "test@example.com", password:"test"},
    {name: "user",email: "user@example.com", password:"user"}
]
users.each do |u|
    User.create(u)
end

restaurants = [
    {name: "THE BEULAH", genre: "Traditional", email: "beulah@example.com", password: "beulah"},
    {name: "MANTANAH", genre: "Thai Cuisine", email: "mantanah@example.com", password: "mantanah"},
    {name: "Yo! Sushi", genre: "Sushi", email: "yosushy@example.com", password: "yosushy"}
]
restaurants.each do |r|
    Restaurant.create(r)
end

items1 = [
    {name: "BREADED MUSHROOMS", description: "With a garlic mayo dip", genre: "Starters", price: "$4.99"},
    {name: "BUTTERMILK-FRIED CHICKEN TENDERS", description: "Add some heat with a dusting of our Nashville hot seasoning", genre: "Main", price: "$7.99"},
    {name: "CRACKERJACK PRAWNS", description: "With our new Green Devil sauce", genre: "Main", price: "$5.99"},
    {name: "CALAMARI STRIPS", description: "With a garlic mayo dip", genre: "Starters", price: "$10.99"},
    {name: "CHEESY GARLIC BREAD", description: "With mozzarella and Cheddar", genre: "Starters", price: "$9.99"},
    {name: "BUFFALO CAULIFLOWER", description: "With garlic mayo dip", genre: "Main", price: "$6.99"}
]

r1 = Restaurant.find_by(name: "THE BEULAH")
items1.each do |i|
  r1.items.create(i)
end

items2 = [
    {name: "MIXED STARTER", description: "Mantanah mixed starter included with fish cakes, golden bag, golden triangle, prawns and vegetable mini spring rolls served with sweet chilli sauce (10 pieces", genre: "Starters", price: "$11.95"},
    {name: "SATEH", description: "Barbecue skewers chicken marinated in a mixture of spice and curry powder, served with peanut sauce (4 pieces)", genre: "Starters", price: "$4.95"},
    {name: "MANTANAH FISH CAKE", description: "Mixture of fish in spicy curry flavour, served with sweet chilli sauce top up with crushed peanuts (5 pieces)", genre: "Starters", price: "$5.99"},
    {name: "TOM YAM POH TEAK", description: "Spicy hot soup with mixed seafood, mushroom lemongrass, fresh lemon juice, bird-eyes chilli served in special 'Steamboat Pot'", genre: "Main", price: "$12.99"},
    {name: "DRAGON DANCE", description: "Slice of beef a touch of red wine cook with green beans, bean sprouts, onions, spring onion and dry chilies", genre: "Main", price: "$6.99"},
    {name: "KHAO PHAD KHAI", description: "Fried rice with egg & spring onion", genre: "Rice", price: "$6.99"}
]

r2 = Restaurant.find_by(name: "MANTANAH")
items2.each do |i|
  r2.items.create(i)
end

items3 = [
    {name: "Aburi Salmon Nigiri", description: "Salmon topped with garlic mayo & ponzu sauce, lightly seared with a blow torch for a delicious finish.", genre: "Starters", price: "$7.99"},
    {name: "Beetroot Cured Salmon Sashimi", description: "Dazzling beetroot cured slices of salmon served with lemon.", genre: "Starters", price: "$8.99"},
    {name: "YO! Roll", description: "Our signature roll! Fresh salmon, avocado & mayo, rolled in orange masago.", genre: "Main", price: "$9.99"},
    {name: "Avocado Maki", description: "Avocado & vegan mayo wrapped in a nori roll.", genre: "Main", price: "$14.99"},
    {name: "Aromatic Duck Roll", description: "Aromatic roast duck, hoisin sauce, cucumber, spring onion, rolled in rice paper.", genre: "Main", price: "$9.99"},
    {name: "Beef Tataki", description: "Pepper-seared rare beef and tangy coriander pesto.", genre: "Main", price: "$8.99"}
]

r3 = Restaurant.find_by(name: "Yo! Sushi")
items3.each do |i|
  r3.items.create(i)
end
