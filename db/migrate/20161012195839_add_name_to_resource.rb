class AddNameToResource < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :name, :string
  end
end
