# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_menu, mutation: Mutations::UpdateMenu
  end
end
