module Types
  class ModifierGroupType < Types::BaseObject
    field :id, ID, null: false
    field :label, String, null: false
    field :selection_required_min, Int, null: false
    field :selection_required_max, Int
    field :modifiers, [ ModifierType ], null: true
  end
end
