class Menu < ApplicationRecord
    has_many :menu_sections, dependent: :restrict_with_error
    has_many :sections, through: :menu_sections

    validates :end_date, comparison: { greater_than: :start_date }, if: -> { end_date.present? }
end
