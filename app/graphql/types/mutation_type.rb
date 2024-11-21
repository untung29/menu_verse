# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_modifier, mutation: Mutations::UpdateModifier
    field :update_modifier_group, mutation: Mutations::UpdateModifierGroup
    field :update_item, mutation: Mutations::UpdateItem
    field :update_section, mutation: Mutations::UpdateSection
    field :update_menu, mutation: Mutations::UpdateMenu
  end
end
