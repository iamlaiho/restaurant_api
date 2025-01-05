# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :identifier, String, null: false
    field :type, String, null: false
    field :label, String, null: false
    field :description, String, null: false
    field :price, Float, null: false
    field :modifier, ModifierType, null: true
  end
end
