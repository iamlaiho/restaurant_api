# frozen_string_literal: true

module Mutations
  module Modifiers
    class UpdateModifier < ::Mutations::BaseMutation
      argument :item_identifier, String, required: true
      argument :default_quantity, Integer, required: true
      argument :price_override, Float, required: true

      type Types::ModifierType

      def resolve(item_identifier:, default_quantity:, price_override:)
        modifier = Modifier.includes(:item).find_by!(item: { identifier: item_identifier })
        modifier.update!(default_quantity: default_quantity, price_override: price_override)

        modifier
      rescue ActiveRecord::RecordNotFound
        GraphQL::ExecutionError.new('Failed to update modifier: item has no modifier')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Failed to update modifier: #{e.message}")
      end
    end
  end
end
