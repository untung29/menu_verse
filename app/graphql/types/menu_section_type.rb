module Types
  class MenuSectionType < Types::BaseObject
    field :section_id, ID, null: false
    field :label, String, null: false
    field :description, String
    field :items, [ ItemType ], null: true
    field :state, String, null: false
    field :display_order, Int, null: false
  end
end
