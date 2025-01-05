# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :menus, [Types::MenuType], null: true, description: 'Fetches all menus'

    def menus
      Menu.all
    end

    field :menu, Types::MenuType, null: true, description: 'Fetches a menu which includes the sections and items' do
      argument :identifier, String, required: true, description: 'Identifier of the menu'
    end

    def menu(identifier:)
      Menu.includes(:sections).find_by(identifier:)
    end
  end
end
