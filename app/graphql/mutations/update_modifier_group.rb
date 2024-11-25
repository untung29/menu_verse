# frozen_string_literal: true

module Mutations
  class UpdateModifierGroup < BaseMutation
    # Return Fields
    field :modifier_group, Types::ModifierGroupType, null: true
    field :errors, [ String ], null: false


    # Arguments
    argument :id, ID, required: true
    argument :label, String, required: false
    argument :selection_required_min, Int, required: false
    argument :selection_required_max, Int, required: false


    def resolve(id:, label: nil, selection_required_min: nil, selection_required_max: nil)
      modifier_group = ModifierGroup.find_by(id: id)

      # Return error if not found
      return { modifier_group: nil, errors: [ "Modifier Group not found" ] } unless modifier_group

      if modifier_group.update({ label: label, selection_required_min: selection_required_min, selection_required_max: selection_required_max }.compact)
        { modifier_group: modifier_group, errors: [] }
      else
        { modifier_group: nil, errors: modifier_group.errors.full_messages }
      end
    end
  end
end
