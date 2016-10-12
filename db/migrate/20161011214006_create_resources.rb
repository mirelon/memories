class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :url
      t.references :author, references: :people, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
