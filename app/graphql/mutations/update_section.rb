# frozen_string_literal: true

module Mutations
  class UpdateSection < BaseMutation
    # Return fields
    field :section, Types::SectionType, null: true
    field :errors, [ String ], null: false


    # Arguments
    argument :id, ID, required: true
    argument :label, String, required: false
    argument :description, String, required: false

    def resolve(id:, label: nil, description: nil)
      section = Section.find_by(id: id)

      return { section: section, errors: [ "Section not found" ] } unless section

      if section.update({ label: label, description: description }.compact)
        { section: section, errors: [] }
      else
      { section: nil, menu: section.errors.full_messages }
      end
    end
  end
end
