module Types
    class MenuType < Types::BaseObject
        field :id, ID, null: false
        field :label, String, null: false
        field :state, String, null: false
        field :start_date, GraphQL::Types::ISO8601DateTime, null: false
        field :end_date, GraphQL::Types::ISO8601DateTime, null: true
        field :sections, [ SectionType ], null: true
    end
end
