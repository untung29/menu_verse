# frozen_string_literal: true

module Mutations
  class UpdateModifier < BaseMutation
    # Return fields
    field :modifier, Types::ModifierType, null: true
    field :errors, [ String ], null: false

    # Arguments
    argument :id, ID, required: true
    argument :display_order, Int, required: false
    argument :default_quantity, Int, required: false
    argument :price_override, Float, required: false

    def resolve(id:, display_order: nil, default_quantity: nil, price_override: nil)
      modifier = Modifier.find_by(id: id)

      # Return error if not found
      return { modifier: nil, errors: [ "Modifier not found" ] } unless modifier


      if modifier.update({ display_order: display_order, default_quantity: default_quantity, price_override: price_override }.compact)
        { modifier: modifier, errors: [] }
      else
        { modifier: nil, errors: modifier.errors.full_messages }
      end
    end
  end
end
