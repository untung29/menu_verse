module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :type, String
    field :label, String, null: false
    field :description, String
    field :price, Float, null: false
    field :quantity, Int, null: false
    field :modifier_groups, [ ModifierGroupType ], null: true
  end
end
