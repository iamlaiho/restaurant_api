# frozen_string_literal: true

class ModifierGroup < ApplicationRecord
  has_many :modifiers
  has_many :items, through: :modifiers
  has_one :item_modifier_group
  has_one :item, through: :item_modifier_group

  validates :label, length: { in: 1..999 }
  validates :selection_required_min, numericality: { greater_than_or_equal_to: 0, less_than: 100 }
  validates :selection_required_max, numericality: { greater_than_or_equal_to: 0, less_than: 100 }
  validates :selection_required_max,
            comparison: { greater_than_or_equal_to: :selection_required_min },
            if: -> { selection_required_min.present? && selection_required_max.present? }

  before_create { self.identifier = SecureRandom.uuid }
  before_update { identifier.reload }
end
