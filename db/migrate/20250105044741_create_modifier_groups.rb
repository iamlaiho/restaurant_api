# frozen_string_literal: true

class CreateModifierGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :modifier_groups do |t|
      t.string :identifier, null: false
      t.string :label, null: false
      t.integer :selection_required_min, null: false
      t.integer :selection_required_max, null: false

      t.timestamps
    end
  end
end
