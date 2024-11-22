# Clear existing data to prevent duplication
def clear_existing_data
  [ ItemModifierGroup, MenuSection, SectionItem, Modifier, Section, Menu, Item, ModifierGroup ].each(&:destroy_all)
end

# Create Menus
def create_menus
  menus = [
    { label: "Breakfast Menu", state: "active", start_date: Date.today, end_date: nil },
    { label: "Lunch Menu", state: "inactive", start_date: Date.today, end_date: Date.today + 30 },
    { label: "Dinner Menu", state: "draft", start_date: Date.today, end_date: Date.today + 30 }
  ]
  menus.each { |menu| Menu.create!(menu) }
end

def fetch_menus
  {
    breakfast_menu: Menu.find_by(label: "Breakfast Menu"),
    lunch_menu: Menu.find_by(label: "Lunch Menu"),
    dinner_menu: Menu.find_by(label: "Dinner Menu")
  }
end

# Create Sections
def create_sections
  sections = [
    { label: "Beverages", description: "Hot and cold drinks" },
    { label: "Appetizers", description: "Start your meal with these" },
    { label: "Main Course", description: "Hearty and filling dishes" },
    { label: "Desserts", description: "Sweet treats to end your meal" }
  ]
  sections.each { |section| Section.create!(section) }
end

def fetch_sections
  {
    beverages_section: Section.find_by(label: "Beverages"),
    appetizers_section: Section.find_by(label: "Appetizers"),
    main_course_section: Section.find_by(label: "Main Course"),
    desserts_section: Section.find_by(label: "Desserts")
  }
end

# Create MenuSections
def create_menu_sections(menus, sections)
  menu_sections = [
    { menu: menus[:breakfast_menu], section: sections[:appetizers_section], display_order: 2 },
    { menu: menus[:lunch_menu], section: sections[:beverages_section], display_order: 1 },
    { menu: menus[:lunch_menu], section: sections[:main_course_section], display_order: 2 },
    { menu: menus[:dinner_menu], section: sections[:desserts_section], display_order: 2 }
  ]
  menu_sections.each { |menu_section| MenuSection.create!(menu_section) }
end

# Create Items
def create_items
  items = [
    { type: "Product", label: "Coffee", description: "Hot brewed coffee", price: 3.0 },
    { type: "Product", label: "Tea", description: "Freshly brewed tea", price: 2.5 },
    { type: "Product", label: "Soup", description: "Warm and hearty soup", price: 5.0 },
    { type: "Product", label: "Pizza", description: "Cheese and tomato pizza", price: 12.0 },
    { type: "Product", label: "Ice Cream", description: "Vanilla ice cream scoop", price: 4.0 },
    { type: "Component", label: "Extra Shot", description: "Extra coffee shot", price: 0.5 },
    { type: "Component", label: "Whipped Cream", description: "Cream topping", price: 0.7 },
    { type: "Component", label: "Cheese", description: "Cheese topping", price: 1.0 },
    { type: "Component", label: "Peppers", description: "Spicy pepper topping", price: 0.8 },
    { type: "Component", label: "Chocolate Syrup", description: "Chocolate drizzle", price: 0.6 }
  ]
  items.each { |item| Item.create!(item) }
end

def fetch_items
  {
    coffee_item: Item.find_by(label: "Coffee"),
    tea_item: Item.find_by(label: "Tea"),
    soup_item: Item.find_by(label: "Soup"),
    pizza_item: Item.find_by(label: "Pizza"),
    ice_cream_item: Item.find_by(label: "Ice Cream")
  }
end

# Create SectionItems
def create_section_items(sections, items)
  section_items = [
    { section: sections[:beverages_section], item: items[:coffee_item], display_order: 1 },
    { section: sections[:beverages_section], item: items[:tea_item], display_order: 2 },
    { section: sections[:appetizers_section], item: items[:soup_item], display_order: 1 },
    { section: sections[:main_course_section], item: items[:pizza_item], display_order: 1 },
    { section: sections[:desserts_section], item: items[:ice_cream_item], display_order: 1 }
  ]
  section_items.each { |section_item| SectionItem.create!(section_item) }
end

# Create Modifier Groups
def create_modifier_groups
  modifier_groups = [
    { label: "Coffee Add-ons", selection_required_min: 0, selection_required_max: 2 },
    { label: "Tea Add-ons", selection_required_min: 0, selection_required_max: 2 },
    { label: "Soup Toppings", selection_required_min: 1, selection_required_max: 3 },
    { label: "Pizza Toppings", selection_required_min: 1, selection_required_max: 4 },
    { label: "Ice Cream Toppings", selection_required_min: 0, selection_required_max: 3 }
  ]
  modifier_groups.each { |group| ModifierGroup.create!(group) }
end

def fetch_modifier_groups
  ModifierGroup.all.index_by(&:label)
end

# Create ItemModifierGroups
def create_item_modifier_groups(items, modifier_groups)
  item_modifier_groups = [
    { item: items[:coffee_item], modifier_group: modifier_groups["Coffee Add-ons"] },
    { item: items[:tea_item], modifier_group: modifier_groups["Tea Add-ons"] },
    { item: items[:soup_item], modifier_group: modifier_groups["Soup Toppings"] },
    { item: items[:pizza_item], modifier_group: modifier_groups["Pizza Toppings"] },
    { item: items[:ice_cream_item], modifier_group: modifier_groups["Ice Cream Toppings"] }
  ]
  item_modifier_groups.each { |association| ItemModifierGroup.create!(association) }
end

# Create Modifiers
def create_modifiers
  modifiers = [
    # Coffee Add-ons
    { item: Item.find_by(label: "Extra Shot"), modifier_group: ModifierGroup.find_by(label: "Coffee Add-ons"), display_order: 0, default_quantity: 1, price_override: 0.5 },
    { item: Item.find_by(label: "Whipped Cream"), modifier_group: ModifierGroup.find_by(label: "Coffee Add-ons"), display_order: 2, default_quantity: 0, price_override: 0.7 },

    # Pizza Toppings
    { item: Item.find_by(label: "Cheese"), modifier_group: ModifierGroup.find_by(label: "Pizza Toppings"), display_order: 1, default_quantity: 1, price_override: 1.0 },
    { item: Item.find_by(label: "Peppers"), modifier_group: ModifierGroup.find_by(label: "Pizza Toppings"), display_order: 2, default_quantity: 0, price_override: 0.8 },

    # Ice Cream Toppings
    { item: Item.find_by(label: "Chocolate Syrup"), modifier_group: ModifierGroup.find_by(label: "Ice Cream Toppings"), display_order: 1, default_quantity: 1, price_override: 0.6 }
  ]
  modifiers.each { |modifier| Modifier.create!(modifier) }
end

# Execute Seed Methods
clear_existing_data
create_menus
menus = fetch_menus
create_sections
sections = fetch_sections
create_menu_sections(menus, sections)
create_items
items = fetch_items
create_section_items(sections, items)
create_modifier_groups
modifier_groups = fetch_modifier_groups
create_item_modifier_groups(items, modifier_groups)
create_modifiers
