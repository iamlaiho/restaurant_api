# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_modifier, mutation: Mutations::Modifiers::UpdateModifier
  end
end
