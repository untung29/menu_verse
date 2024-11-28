module Types
  class MenuSectionType < Types::BaseObject
    field :detail, SectionType, null: false
    field :display_order, Int, null: false

    def detail
      object.section
    end
  end
end
