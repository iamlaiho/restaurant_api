# frozen_string_literal: true

class CreateItemModifierGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :item_modifiers do |t|
      t.references :items, null: false, foreign_key: true
      t.references :modifier_groups, null: false, foreign_key: true

      t.timestamps
    end
  end
end
