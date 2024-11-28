module Types
    class MenuType < Types::BaseObject
        field :id, ID, null: false
        field :label, String, null: false
        field :state, String, null: false
        field :start_date, GraphQL::Types::ISO8601DateTime, null: false
        field :end_date, GraphQL::Types::ISO8601DateTime, null: true
        field :sections, [ MenuSectionType ], null: false

    def sections
      object.menu_sections.includes(:section).order(:display_order).map do |menu_section|
        menu_section.attributes.merge(menu_section.section.attributes)
      end
    end
    end
end
