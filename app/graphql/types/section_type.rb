# frozen_string_literal: true

module Types
  class SectionType < Types::BaseObject
    field :identifier, String, null: false
    field :label, String, null: false
    field :description, String, null: false
    field :items, [ItemType], null: true
  end
end
