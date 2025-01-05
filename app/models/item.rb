# frozen_string_literal: true

class Item < ApplicationRecord
  has_one :section_item
  has_one :section, through: :section_item
end