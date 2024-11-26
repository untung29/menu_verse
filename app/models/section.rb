class Section < ApplicationRecord
    has_one :menu_section, dependent: :restrict_with_error
    has_one :menu, through: :menu_sections

    has_many :section_items
    has_many :items, through: :section_items

    STATES = %w[active inactive].freeze

    validates :state, inclusion: { in: STATES }
end
