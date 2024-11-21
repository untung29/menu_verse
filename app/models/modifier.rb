class Modifier < ApplicationRecord
  belongs_to :item, class_name: "Component"
  belongs_to :modifier_group
end
