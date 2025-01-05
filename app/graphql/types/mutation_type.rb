# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_modifier, mutation: Mutations::Modifiers::CreateModifier
    field :create_modifier_group, mutation: Mutations::ModifierGroups::CreateModifierGroup
  end
end
