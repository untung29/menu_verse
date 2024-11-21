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
  end
end
