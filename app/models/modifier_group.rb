# frozen_string_literal: true

class ModifierGroup < ApplicationRecord
  has_many :modifiers
  has_many :items, through: :modifiers
end
