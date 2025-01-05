# frozen_string_literal: true

class ItemModifierGroup < ApplicationRecord
  belongs_to :item
  belongs_to :modifier_group

  accepts_nested_attributes_for :item
end
