class AddCounterCaches < ActiveRecord::Migration[5.0]
  def up
    add_column :people, :event_count, :integer, default: 0
    Person.reset_column_information
    Person.all.each do |p|
      p.update_attribute :event_count, p.events.length
    end

    add_column :events, :people_count, :integer, default: 0
    add_column :events, :resources_count, :integer, default: 0
    Event.reset_column_information
    Event.all.each do |e|
      e.update_attribute :people_count, e.people.length
      e.update_attribute :resources_count, e.resources.length
    end
  end

  def down
    remove_column :people, :event_count
    remove_column :events, :people_count
    remove_column :events, :resources_count
  end
end
