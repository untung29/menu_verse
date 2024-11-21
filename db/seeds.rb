# Clear existing data to prevent duplication
MenuSection.destroy_all
Section.destroy_all
Menu.destroy_all
SectionItem.destroy_all
Item.destroy_all
Section.destroy_all



# Seed Menus
menus = [
  { label: "Breakfast Menu", state: "active", start_date: Date.today, end_date: Date.today + 30 },
  { label: "Lunch Menu", state: "inactive", start_date: Date.today, end_date: Date.today + 30 },
  { label: "Dinner Menu", state: "active", start_date: Date.today, end_date: Date.today + 30 }
]

menus.each { |menu| Menu.create!(menu) }

# Fetch all menus for associations
breakfast_menu = Menu.find_by(label: "Breakfast Menu")
lunch_menu = Menu.find_by(label: "Lunch Menu")
dinner_menu = Menu.find_by(label: "Dinner Menu")

# Seed Sections
sections = [
  { label: "Beverages", description: "Hot and cold drinks" },
  { label: "Appetizers", description: "Start your meal with these" },
  { label: "Main Course", description: "Hearty and filling dishes" },
  { label: "Desserts", description: "Sweet treats to end your meal" }
]

sections.each { |section| Section.create!(section) }

# Fetch all sections for associations
beverages_section = Section.find_by(label: "Beverages")
appetizers_section = Section.find_by(label: "Appetizers")
main_course_section = Section.find_by(label: "Main Course")
desserts_section = Section.find_by(label: "Desserts")

# Seed MenuSections (Associations with display_order)
menu_sections = [
  { menu: breakfast_menu, section: appetizers_section, display_order: 2 },
  { menu: lunch_menu, section: beverages_section, display_order: 1 },
  { menu: lunch_menu, section: main_course_section, display_order: 2 },
  { menu: dinner_menu, section: desserts_section, display_order: 2 }
]

menu_sections.each { |menu_section| MenuSection.create!(menu_section) }


# Seed Items
items = [
  { type: "Product", label: "Coffee", description: "Hot brewed coffee", price: 3.0 },
  { type: "Product", label: "Tea", description: "Freshly brewed tea", price: 2.5 },
  { type: "Product", label: "Soup", description: "Warm and hearty soup", price: 5.0 },
  { type: "Product", label: "Pizza", description: "Cheese and tomato pizza", price: 12.0 },
  { type: "Product", label: "Ice Cream", description: "Vanilla ice cream scoop", price: 4.0 }
]

items.each { |item| Item.create!(item) }

# Fetch Items for associations
coffee_item = Item.find_by(label: "Coffee")
tea_item = Item.find_by(label: "Tea")
soup_item = Item.find_by(label: "Soup")
pizza_item = Item.find_by(label: "Pizza")
ice_cream_item = Item.find_by(label: "Ice Cream")


# Seed SectionItems (Associations with display_order)
section_items = [
  { section: beverages_section, item: coffee_item, display_order: 1 },
  { section: beverages_section, item: tea_item, display_order: 2 },
  { section: appetizers_section, item: soup_item, display_order: 1 },
  { section: main_course_section, item: pizza_item, display_order: 1 },
  { section: desserts_section, item: ice_cream_item, display_order: 1 }
]

section_items.each { |section_item| SectionItem.create!(section_item) }



puts "Seeded #{Menu.count} menus, #{Section.count} sections, and #{MenuSection.count} menu sections."