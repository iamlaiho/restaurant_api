# frozen_string_literal: true

class SectionItem < ApplicationRecord
  belongs_to :section
  belongs_to :item

  validates :display_order,
            uniqueness: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 100 }
end
