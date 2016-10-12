ActiveAdmin.register Event do
  permit_params :name, :year, :date_from, :date_to, :text, resources_attributes: [:id, :url, :_destroy], event_people_attributes: [:id, :person_id, :_destroy]

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
        event.resources.map { |r| link_to r.url, r.url, target: '_blank' }.join('').html_safe
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
        deg.input :person
      end
      f.has_many :resources, allow_destroy: true do |deg|
        deg.input :url
      end
    end
    f.actions
  end 


end
