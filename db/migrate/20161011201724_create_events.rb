class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :year
      t.date :date_from
      t.date :date_to
      t.string :text

      t.timestamps
    end
  end
end
