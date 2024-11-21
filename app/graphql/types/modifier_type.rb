module Types
  class ModifierType < Types::BaseObject
    field :id, ID, null: false
    field :display_order, Int, null: false
    field :default_quantity, Int, null: false
    field :price_override, Float
  end
end
