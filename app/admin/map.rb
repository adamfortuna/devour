  ActiveAdmin.register Map do
  permit_params :title, :short_title, :description,
                location_maps_attributes: [:id, :location_id, :rating, :description, :order, :show_order, :_destroy]

  before_filter :only => [:show, :edit, :update, :destroy] do
    @map = Map.friendly.find(params[:id])
  end

  show do
    @map = Map.friendly.find(params[:id])
    attributes_table do
      row :id
      row :created_at
      row :updated_at
      row :title
      row :short_title
      row :slug
      row :description
    end


    panel "Locations" do
      @map.location_maps.by_order.each do |lm|
        panel lm.location.name do
          attributes_table_for lm do
            row :order
            row :show_order
            attributes_table_for lm.location do
              row :description
            end
          end
        end
      end
    end
  end


  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :short_title
      f.input :description
    end

    f.has_many :location_maps, heading: 'Locations', sortable: :order, allow_destroy: true, new_record: true do |location_map|
      location_map.inputs :location, :show_order
    end

    f.actions
  end
end
