ActiveAdmin.register Map do
  permit_params :title, :short_title, :description,
                location_maps_attributes: [ :location_id, :rating, :description, :show_order, :_destroy ]

  before_filter :only => [:show, :edit, :update, :destroy] do
    @map = Map.friendly.find(params[:id])
  end

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :short_title
      f.input :description
    end

    f.has_many :location_maps, heading: 'Locations', sortable: :order, new_record: true do |location_map|
      location_map.inputs :location, :rating, :description
    end

    f.actions
  end
end
