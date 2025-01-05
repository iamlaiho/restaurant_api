# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_modifier, mutation: Mutations::Modifiers::CreateModifier
  end
end
