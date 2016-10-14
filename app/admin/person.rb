ActiveAdmin.register Person do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :nick, :firstname, :lastname, :facebook, :linkedin, :gmail
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  column :id
  column :nick
  column :firstname
  column :lastname
  column :gmail
  column :event_count
  actions
end

end
