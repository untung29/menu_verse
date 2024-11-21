# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :menus, [ MenuType ], null: false, description: "Retrieve a list of menus"

    def menus
      Menu.all
    end
  end
end
