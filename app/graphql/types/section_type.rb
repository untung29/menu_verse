module Types
  class SectionType < Types::BaseObject
    field :id, ID, null: false
    field :label, String, null: false
    field :description, String
    field :items, [ SectionItemType ], null: false
    field :state, String, null: false

    def items
      object.section_items.includes(:item).order(:display_order)
    end
  end
end
