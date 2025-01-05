# frozen_string_literal: true

class Item < ApplicationRecord
  self.inheritance_column = :_type_disabled

  VALID_TYPES = %w[product component].freeze

  has_one :section_item
  has_one :section, through: :section_item
  has_one :modifier
  has_one :modifier_group, through: :modifier
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups

  validates :label, length: { in: 1..999 }
  validates :description, length: { in: 1..9999 }
  validates :type, inclusion: { in: VALID_TYPES }
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than: 1000 }

  before_create { self.identifier = SecureRandom.uuid }
  before_update { identifier.reload }

  def price
    super.present? ? super.to_f : nil
  end
end
