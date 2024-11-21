module Types
    class MenuType < Types::BaseObject
        field :id, ID, null:false
        field :label, String, null: false
    end
end