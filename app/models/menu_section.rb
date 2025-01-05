# frozen_string_literal: true

class MenuSection < ApplicationRecord
  belongs_to :menu
  belongs_to :section

  accepts_nested_attributes_for :section

  validates :display_order,
            uniqueness: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 100 }
end
