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
  end
end
