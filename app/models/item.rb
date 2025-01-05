# frozen_string_literal: true

class Item < ApplicationRecord
  has_one :section_item
  has_one :section, through: :section_item
  has_one :modifier
  has_one :modifier_group, through: :modifier
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups

  before_create { self.identifier = SecureRandom.uuid }
  before_update { identifier.reload }
end
