# frozen_string_literal: true

class Modifier < ApplicationRecord
  belongs_to :item
  belongs_to :modifier_group

  validates :display_order,
            uniqueness: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 100 }
  validates :default_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 100 }
  validates :price_override, numericality: { greater_than_or_equal_to: 0, less_than: 1000 }
end
