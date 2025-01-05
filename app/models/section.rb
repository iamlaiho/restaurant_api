# frozen_string_literal: true

class Section < ApplicationRecord
  has_one :menu_section
  has_one :menu, through: :menu_section
  has_many :section_items
  has_many :items, through: :section_items

  accepts_nested_attributes_for :section_items

  validates :label, length: { in: 1..999 }
  validates :description, length: { in: 1..999 }

  before_create { self.identifier = SecureRandom.uuid }
  before_update { identifier.reload }
end
