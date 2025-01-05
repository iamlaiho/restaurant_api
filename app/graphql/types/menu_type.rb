# frozen_string_literal: true

module Types
  class MenuType < Types::BaseObject
    field :identifier, String, null: false
    field :label, String, null: false
    field :state, String, null: false
    field :sections, [SectionType], null: true
  end
end
