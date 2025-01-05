# frozen_string_literal: true

module Types
  class ModifierGroupType < Types::BaseObject
    field :identifier, String, null: false
    field :label, String, null: false
    field :modifiers, [ModifierType], null: false
    field :selection_required_min, Integer, null: false
    field :selection_required_max, Integer, null: false
  end
end
