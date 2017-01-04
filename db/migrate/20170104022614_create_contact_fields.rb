class CreateContactFields < ActiveRecord::Migration
  def change
    create_table :contact_fields do |t|
      t.references :custom_field, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true
      t.text :value

      t.timestamps null: false
    end
  end
end
