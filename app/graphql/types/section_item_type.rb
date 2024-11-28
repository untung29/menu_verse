module Types
  class SectionItemType < Types::BaseObject
    field :detail, ItemType, null: false
    field :display_order, Int, null: false


    def detail
      object.item
    end
  end
end
