class AddColumnOptionsToCustomField < ActiveRecord::Migration
  def change
    add_column :custom_fields, :choices, :text
  end
end
