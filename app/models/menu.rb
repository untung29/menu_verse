class Menu < ApplicationRecord
    has_many :menu_sections, dependent: :restrict_with_error
    has_many :sections, through: :menu_sections
end
