class ModifierGroup < ApplicationRecord
    has_one :item_modifier_group
    has_one :item, through: :item_modifier_group

    has_many :modifiers

    validates :selection_required_min, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :selection_required_max, comparison: { greater_than_or_equal_to: :selection_required_min }, if: -> { selection_required_max.present? }
end
