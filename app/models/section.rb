class Section < ApplicationRecord
    has_one :menu_section, dependent: :restrict_with_error
    has_one :menu, through: :menu_sections
end
