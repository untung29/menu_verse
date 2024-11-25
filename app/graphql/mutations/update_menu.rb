# frozen_string_literal: true

module Mutations
  class UpdateMenu < BaseMutation
    # Return Fields
    field :menu, Types::MenuType, null: true
    field :errors, [ String ], null: false


    # Arguments
    argument :id, ID, required: true
    argument :label, String, required: false
    argument :state, String, required: false
    argument :end_date, GraphQL::Types::ISO8601DateTime, required: false
    argument :start_date, GraphQL::Types::ISO8601DateTime, required: false


    def resolve(id:, label: nil, end_date: nil, start_date: nil, state: nil)
      menu = Menu.find_by(id: id)

      # Return error if menu not found
      return { menu: nil, errors: [ "Menu not found" ] } unless menu


      if menu.update({ label: label, start_date: start_date, end_date: end_date, state: state }.compact)
        { menu: menu, errors: [] }
      else
        { menu: nil, errors: menu.errors.full_messages }
      end
    end
  end
end
