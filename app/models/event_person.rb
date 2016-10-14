class EventPerson < ApplicationRecord
  belongs_to :event, counter_cache: :people_count
  belongs_to :person, counter_cache: :event_count
end
