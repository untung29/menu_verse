class Modifier < ApplicationRecord
  belongs_to :item, class_name: "Component"
  belongs_to :modifier_group

  validates :default_quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :price_override, numericality: { greater_than_or_equal_to: 0 }
  validates :display_order, numericality: { greater_than_or_equal_to: 0 }
end
