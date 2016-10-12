class CreateEventPeople < ActiveRecord::Migration[5.0]
  def change
    create_table :event_people do |t|
      t.references :event, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
