module Types
    class MenuType < Types::BaseObject
        field :id, ID, null: false
        field :label, String, null: false
        field :state, String, null: false
        # TODO: update this later to have a better type
        field :start_date, GraphQL::Types::ISO8601Date, null: false
        field :end_date, GraphQL::Types::ISO8601Date, null: true
    end
end
