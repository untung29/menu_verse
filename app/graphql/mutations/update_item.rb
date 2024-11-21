# frozen_string_literal: true

module Mutations
  class UpdateItem < BaseMutation
    # Return Fields
    field :item, Types::ItemType, null: true
    field :errors, [ String ], null: false

    # Arguments
    argument :id, ID, required: true
    argument :label, String, required: false
    argument :description, String, required: false
    argument :price, Float, required: false

    def resolve(id:, label: nil, description: nil, price: nil)
      item = Item.find_by(id: id)
      # Return error if not found
      { item: nil, errors: [ "Item not found" ] } unless item


      if item.update({ label: label, description: description, price: price }.compact)
        { item: item, errors: [] }
      else
        { item: nil, errors: item.errors.full_messages }
      end
    end
  end
end