# frozen_string_literal: true

module Mutations
  module ModifierGroups
    class CreateModifierGroup < ::Mutations::BaseMutation
      argument :item_identifier, String, required: true
      argument :label, String, required: true
      argument :selection_required_min, Integer, required: true
      argument :selection_required_max, Float, required: true

      type Types::ModifierGroupType

      def resolve(item_identifier:, label:, selection_required_min:, selection_required_max:)
        item = Item.find_by!(identifier: item_identifier)

        ModifierGroup.create!(label: label,
                              selection_required_min: selection_required_min,
                              selection_required_max: selection_required_max,
                              item_modifier_group_attributes: {
                                item_id: item.id
                              })
      rescue ActiveRecord::RecordNotFound
        GraphQL::ExecutionError.new('Failed to create modifier group: item not found')
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Failed to create modifier group: #{e.message}")
      end
    end
  end
end
