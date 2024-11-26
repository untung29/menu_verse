module Types
  class SectionType < Types::BaseObject
    field :id, ID, null: false
    field :label, String, null: false
    field :description, String
    field :items, [ ItemType ], null: true
    field :state, String, null: false
  end
end
