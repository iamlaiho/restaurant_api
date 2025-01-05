# frozen_string_literal: true

class CreateMenuSections < ActiveRecord::Migration[7.1]
  def change
    create_table :menu_sections do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.integer :display_order, default: 0

      t.timestamps
    end

    add_index :menu_sections, %i[menu_id display_order], unique: true
  end
end
