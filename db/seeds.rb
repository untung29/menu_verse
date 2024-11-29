# Clear existing data to prevent duplication
[ ItemModifierGroup, MenuSection, SectionItem, Modifier, Section, Menu, Item, ModifierGroup ].each(&:destroy_all)

menu = Menu.create!(label: "Pizza Palace Menu", state: "active", start_date: Date.today, end_date: nil)

pizza_section = Section.create!(
  label: "Customizable Dishes",
  description: "Create your perfect meal with add-ons"
)

drink_section = Section.create!(
  label: "Drinks",
  description: "Refreshing beverages to pair with your pizza"
)

# Associate sections with the menu
MenuSection.create!(menu: menu, section: pizza_section, display_order: 1)
MenuSection.create!(menu: menu, section: drink_section, display_order: 2)


# Non configurable section items
non_configurable_items = [
  { type: "Product", label: "Coke", description: "Chilled Coca-Cola", price: 2.5, quantity: 0 },
  { type: "Product", label: "Iced Tea", description: "Refreshing iced tea with lemon", price: 2.0, quantity: 5 }
]

non_configurable_items.each do |item_data|
  item = Item.create!(item_data)
  SectionItem.create!(section: drink_section, item: item, display_order: non_configurable_items.index(item_data) + 1)
end


# Configurable section items
margherita_pizza = Item.create!(
  type: "Product",
  label: "Margherita Pizza",
  description: "Classic cheese pizza with a customizable topping selection",
  price: 12.0,
  quantity: 5
)

# Create a modifier group for pizza toppings
pizza_toppings_group = ModifierGroup.create!(
  label: "Pizza Toppings",
  selection_required_min: 0,
  selection_required_max: 4
)

# Associate the modifier group with the pizza
ItemModifierGroup.create!(item: margherita_pizza, modifier_group: pizza_toppings_group)

# Add modifiers to the group
modifiers = [
  { item: Item.create!(type: "Component", label: "Extra Cheese", description: "More cheesy goodness", price: 1.5), display_order: 1, default_quantity: 0, modifier_group: pizza_toppings_group },
  { item: Item.create!(type: "Component", label: "Pepperoni", description: "Savory pepperoni slices", price: 2.0), display_order: 2, default_quantity: 0, modifier_group: pizza_toppings_group },
  { item: Item.create!(type: "Component", label: "Mushrooms", description: "Freshly sliced mushrooms", price: 1.0), display_order: 3, default_quantity: 0, modifier_group: pizza_toppings_group },
  { item: Item.create!(type: "Component", label: "Olives", description: "Black olives for a tangy kick", price: 0.8), display_order: 4, default_quantity: 0, modifier_group: pizza_toppings_group }
]

modifiers.each { |modifier| Modifier.create!(modifier) }

# Associate the customizable pizza with the second section
SectionItem.create!(section: pizza_section, item: margherita_pizza, display_order: 1)

# Create a new Holiday Menu
holiday_menu = Menu.create!(label: "Holiday Menu", state: "active", start_date: Date.today, end_date: Date.today + 30)

# Create Sections for the Holiday Menu
main_dishes_section = Section.create!(label: "Main Dishes", description: "Festive main courses for the holiday season")
desserts_section = Section.create!(label: "Desserts", description: "Sweet holiday treats to end your meal")
drinks_section = Section.create!(label: "Drinks", description: "Refreshing beverages for the holidays")


# Associate sections with the Holiday Menu
MenuSection.create!(menu: holiday_menu, section: main_dishes_section, display_order: 1)
MenuSection.create!(menu: holiday_menu, section: desserts_section, display_order: 2)
MenuSection.create!(menu: holiday_menu, section: drinks_section, display_order: 3)


# Main Dishes
main_dishes_items = [
  { type: "Product", label: "Roast Turkey", description: "Juicy roast turkey with stuffing and cranberry sauce", price: 25.0, quantity: 10 },
  { type: "Product", label: "Honey Glazed Ham", description: "Tender ham with a sweet honey glaze", price: 22.0, quantity: 8 },
  { type: "Product", label: "Prime Rib", description: "Succulent prime rib served with au jus", price: 30.0, quantity: 5 }
]

main_dishes_items.each_with_index do |item_data, index|
  item = Item.create!(item_data)
  SectionItem.create!(section: main_dishes_section, item: item, display_order: index + 1)
end

# Desserts
desserts_items = [
  { type: "Product", label: "Pumpkin Pie", description: "Traditional pumpkin pie with a flaky crust", price: 6.0, quantity: 15 },
  { type: "Product", label: "Gingerbread Cookies", description: "Classic gingerbread cookies with festive decorations", price: 4.5, quantity: 20 },
  { type: "Product", label: "Yule Log Cake", description: "Decadent chocolate cake rolled and decorated like a log", price: 8.0, quantity: 10 }
]

i = 3

desserts_items.each_with_index do |item_data, index|
  item = Item.create!(item_data)
  SectionItem.create!(section: desserts_section, item: item, display_order: i - index)
end


# Drinks
drinks_items = [
  { type: "Product", label: "Eggnog", description: "Creamy eggnog with a hint of nutmeg", price: 3.5, quantity: 25 },
  { type: "Product", label: "Mulled Wine", description: "Warm spiced wine perfect for the holidays", price: 5.0, quantity: 10 },
  { type: "Product", label: "Hot Chocolate", description: "Rich hot chocolate topped with whipped cream", price: 4.0, quantity: 20 }
]

drinks_items.each_with_index do |item_data, index|
  item = Item.create!(item_data)
  SectionItem.create!(section: drinks_section, item: item, display_order: index + 1)
end


# Create the Special Offer Menu
special_offer_menu = Menu.create!(label: "Special Offer Menu", state: "active", start_date: Date.today, end_date: Date.today + 14)

# Create Sections for the Special Offer Menu
limited_time_section = Section.create!(label: "Limited Time Offers", description: "Exclusive dishes available for a short time", state: "inactive")
combo_meals_section = Section.create!(label: "Combo Meals", description: "Specially priced combos for a complete meal")
beverages_section = Section.create!(label: "Special Beverages", description: "Refreshing drinks at a discounted price")

# Associate sections with the Special Offer Menu
MenuSection.create!(menu: special_offer_menu, section: limited_time_section, display_order: 1)
MenuSection.create!(menu: special_offer_menu, section: combo_meals_section, display_order: 2)
MenuSection.create!(menu: special_offer_menu, section: beverages_section, display_order: 3)

# Limited Time Offers
limited_time_items = [
  Item.create!(type: "Product", label: "Truffle Burger", description: "Juicy burger topped with truffle aioli and mushrooms", price: 12.0, quantity: 10),
  Item.create!(type: "Product", label: "Spicy Ramen", description: "Bold and fiery ramen with a spicy broth", price: 10.0, quantity: 15),
  Item.create!(type: "Product", label: "Lobster Mac & Cheese", description: "Decadent mac and cheese with chunks of lobster", price: 14.0, quantity: 8)
]

limited_time_items.each_with_index do |item, index|
  SectionItem.create!(section: limited_time_section, item: item, display_order: index + 1)
end

# Combo Meals
combo_meals_items = [
  Item.create!(type: "Product", label: "Burger Combo", description: "Cheeseburger, fries, and a soft drink", price: 8.5, quantity: 20),
  Item.create!(type: "Product", label: "Pizza Combo", description: "Personal pizza and a soft drink", price: 9.5, quantity: 15),
  Item.create!(type: "Product", label: "Pasta Combo", description: "Spaghetti Bolognese and a side salad", price: 11.0, quantity: 12)
]

combo_meals_items.each_with_index do |item, index|
  SectionItem.create!(section: combo_meals_section, item: item, display_order: index + 1)
end

# Special Beverages
beverages_items = [
  Item.create!(type: "Product", label: "Mango Smoothie", description: "Tropical mango smoothie", price: 3.5, quantity: 25),
  Item.create!(type: "Product", label: "Iced Mocha", description: "Rich mocha served chilled over ice", price: 4.0, quantity: 20),
  Item.create!(type: "Product", label: "Berry Lemonade", description: "Refreshing lemonade infused with mixed berries", price: 3.0, quantity: 30)
]

beverages_items.each_with_index do |item, index|
  SectionItem.create!(section: beverages_section, item: item, display_order: index + 1)
end

# Modifier Group for Limited Time Offers
extras_modifier_group = ModifierGroup.create!(label: "Extras", selection_required_min: 0, selection_required_max: 3)

# Associate modifier group with Truffle Burger (first item in limited_time_items)
ItemModifierGroup.create!(item: limited_time_items.first, modifier_group: extras_modifier_group)

# Extras Modifiers
extras_modifiers = [
  Item.create!(type: "Component", label: "Extra Truffle Sauce", description: "Additional rich truffle sauce", price: 2.0, quantity: 10),
  Item.create!(type: "Component", label: "Bacon", description: "Crispy bacon strips", price: 1.5, quantity: 20),
  Item.create!(type: "Component", label: "Avocado", description: "Creamy avocado slices", price: 1.8, quantity: 15)
]

extras_modifiers.each_with_index do |modifier, index|
  Modifier.create!(item: modifier, display_order: index + 1, default_quantity: 0, modifier_group: extras_modifier_group)
end
