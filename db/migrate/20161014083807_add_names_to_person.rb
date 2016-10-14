class AddNamesToPerson < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :nick, :string
    add_column :people, :firstname, :string
    add_column :people, :lastname, :string
    remove_column :people, :name, :string
  end
end
