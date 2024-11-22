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
  { type: "Product", label: "Coke", description: "Chilled Coca-Cola", price: 2.5 },
  { type: "Product", label: "Iced Tea", description: "Refreshing iced tea with lemon", price: 2.0 }
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
  price: 12.0
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
