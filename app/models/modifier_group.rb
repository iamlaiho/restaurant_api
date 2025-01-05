# frozen_string_literal: true

class ModifierGroup < ApplicationRecord
  has_many :modifiers
  has_many :items, through: :modifiers
  has_one :item_modifier_group
  has_one :item, through: :item_modifier_group
end
