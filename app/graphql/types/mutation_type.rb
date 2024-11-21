# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_item, mutation: Mutations::UpdateItem
    field :update_section, mutation: Mutations::UpdateSection
    field :update_menu, mutation: Mutations::UpdateMenu
  end
end
