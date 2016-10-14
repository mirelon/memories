ActiveAdmin.register Event do
  permit_params :name, :year, :date_from, :date_to, :text, resources_attributes: [:id, :url, :name, :_destroy], event_people_attributes: [:id, :person_id, :_destroy]

  show do |event|
    attributes_table do
      row :name
      row :year
      row :date_from
      row :date_to
      row :text
      row :people do
        event.people.map { |p| p.name }.join(", ").html_safe
      end
      row :resources do
        event.resources.map { |r| link_to r.name, r.url, target: '_blank' }.join('<br/>').html_safe
      end
    end
  end
 
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "events" do
      f.input :name
      f.input :year
      f.input :date_from, as: :datepicker
      f.input :date_to, as: :datepicker
      f.input :text
      f.has_many :event_people, allow_destroy: true do |deg|
        deg.input :person, collection: Person.order(:firstname, :lastname).map{|p| [p.name, p.id]}
      end
      f.has_many :resources, allow_destroy: true do |deg|
        deg.input :url
        deg.input :name
      end
    end
    f.actions
  end

  index do
    selectable_column
    column :name
    column :year
    column :date_from
    column :date_to
    column :text
    column :people_count
    column :resources_count
    actions
  end
end
