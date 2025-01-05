# frozen_string_literal: true

module Mutations
  module Modifiers
    class CreateModifier < ::Mutations::BaseMutation
      argument :item_identifier, String, required: true
      argument :modifier_group_identifier, String, required: true
      argument :default_quantity, Integer, required: true
      argument :price_override, Float, required: true
      argument :display_order, Integer, required: true

      type Types::ModifierType

      def resolve(item_identifier:, modifier_group_identifier:, default_quantity:, price_override:, display_order:)
        item = Item.find_by!(identifier: item_identifier)
        modifier_group = ModifierGroup.find_by!(identifier: modifier_group_identifier)

        Modifier.create!(item: item,
                         modifier_group: modifier_group,
                         default_quantity: default_quantity,
                         price_override: price_override,
                         display_order: display_order)
      rescue ActiveRecord::RecordNotFound
        GraphQL::ExecutionError.new('Failed to create modifier: item or modifier group not found')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Failed to create modifier: #{e.message}")
      end
    end
  end
end
