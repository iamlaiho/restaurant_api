# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

menu = Menu.create!(
  label: '2025 Special',
  state: 'active',
  start_date: Date.new(2024, 12, 0o1),
  end_date: Date.new(2025, 12, 31),
  menu_sections_attributes: [
    {
      display_order: 0,
      section_attributes: {
        label: 'Pizzas',
        description: 'Baked with firewood!',
        section_items_attributes: [
          {
            display_order: 0,
            item_attributes: {
              type: 'product',
              label: 'Cheesy Pizza',
              description: 'Yummy cheesy!',
              price: 15.00
            }
          },
          {
            display_order: 1,
            item_attributes: {
              type: 'product',
              label: 'Spicy Pizza',
              description: 'Yummy spicy',
              price: 20.00
            }
          }
        ]
      }
    },
    {
      display_order: 1,
      section_attributes: {
        label: 'Add-on',
        description: 'Feeling hungry?',
        section_items_attributes: [
          {
            display_order: 0,
            item_attributes: {
              type: 'component',
              label: 'Cheese',
              description: 'Add cheesey to your pizza',
              price: 2.00
            }
          }
        ]
      }
    }
  ]
)

component = menu.sections.last.items.find { |item| item.label == 'Cheese' }
product = menu.sections.first.items.find { |item| item.label == 'Cheesy Pizza' }

ModifierGroup.create!(
  label: 'Add cheese slice(s)',
  selection_required_min: 0,
  selection_required_max: 2,
  modifiers_attributes: [
    {
      item_id: component.id,
      display_order: 0,
      default_quantity: 2,
      price_override: 4.00
    },
    {
      item_id: component.id,
      display_order: 1,
      default_quantity: 4,
      price_override: 8.00
    }
  ],
  item_modifier_group_attributes: {
    item_id: product.id
  }
)
