# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :type, null: false
      t.string :identifier, null: false
      t.string :label, null: false
      t.string :description, null: false
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
