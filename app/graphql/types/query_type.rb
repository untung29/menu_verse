# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Fetch all menus
    field :menus, [ MenuType ], null: false, description: "Retrieve a list of menus"

    def menus
      Menu.all
    end

    # Fetch specific menu
    field :menu, MenuType, null: false, description: "Retrieve a menu by its ID" do
       argument :id, ID, required: true
    end

    def menu(id:)
      Menu.find(id)
    end


    # Fetch all sections
    field :sections, [ SectionType ], null: false, description: "Retrieve a list of sections"

    def sections
      Section.all
    end

    # Fetch specific section
    field :section, SectionType, null: false, description: "Retrieve a specific section" do
      argument :id, ID, required: true
    end

    def section(id:)
      Section.find(id)
    end


    # Fetch all Items
    field :items, [ ItemType ], null: false, description: "Retrieve a list of items"

    def items
      Item.all
    end

    # Fetch specific item
    field :item, ItemType, null: false, description: "Retrieve a specific item" do
      argument :id, ID, required: true
    end

    def item(id:)
      Item.find(id)
    end

    # Fetch a list of modifier groups
    field :modifier_groups, [ ModifierGroupType ], null: false, description: "Retrieve a list of modifier groups"
    def modifier_groups
      ModifierGroup.all
    end

    # Fetch specific modifier group
    field :modifier_group, ModifierGroupType, null: false, description: "Retrieve a specific modifier group" do
      argument :id, ID, required: true
    end

    def modifier_group(id:)
      ModifierGroup.find(id)
    end


    # Fetch a list of modifiers
    field :modifiers, [ ModifierType ], null: false, description: "Retrieve a list of modifiers"
    def modifiers
      Modifier.all
    end
  end
end
