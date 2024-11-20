class ModifierGroup < ApplicationRecord
    has_one :item_modifier_group
    has_one :item, through :item_modifier_group

    has_many :modifiers
end
