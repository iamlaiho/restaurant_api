# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :menu_sections
  has_many :sections, through: :menu_sections

  accepts_nested_attributes_for :menu_sections

  validates_presence_of :start_date, :end_date
  validates :label, length: { in: 1..999 }
  validates :state, length: { in: 1..999 }
  validates :end_date,
            comparison: { greater_than_or_equal_to: :start_date },
            if: -> { start_date.present? && end_date.present? }

  before_create { self.identifier = SecureRandom.uuid }
  before_update { identifier.reload }
end
