module Types
  class ModifierType < Types::BaseObject
    field :id, ID, null: false
    field :display_order, Int, null: false
    field :default_quantity, Int, null: false
    field :price_override, Float
    field :item, ItemType, null: false
    field :modifier_group, ModifierGroupType, null: false
  end
end
