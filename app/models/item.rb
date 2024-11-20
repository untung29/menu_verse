class Item < ApplicationRecord
    has_one :section_item
    has_one :section, through: :section_item

    has_many :item_modifier_groups
    has_many :modifier_groups, through: :item_modifier_groups

    has_one :modifier
end
