# frozen_string_literal: true

module Types
  class ModifierType < Types::BaseObject
    field :display_order, Integer, null: false
    field :default_quantity, Integer, null: false
    field :price_override, Float, null: false
    field :modifier_group, ModifierGroupType, null: false
  end
end
