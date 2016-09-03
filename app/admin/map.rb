  ActiveAdmin.register Map do
  permit_params :title, :short_title, :description, :short_description, :photo, :photo_src, :photo_src_url,
                location_maps_attributes: [:id, :location_id, :rating, :description, :order, :show_order, :_destroy]

  before_filter :only => [:show, :edit, :update, :destroy] do
    @map = Map.friendly.find(params[:id])
  end

  index do
    selectable_column
    column :title
    column :short_description
    column :locations do |map|
      map.locations.count
    end
    actions
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
      row :short_description

      row :photo do
        image_tag(@map.photo.url(:thumb))
      end
      row :photo_src
      row :photo_src_url
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


  form(html: { multipart: true }) do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :short_title
      f.input :description
      f.input :short_description

      f.input :photo, :as => :file
      f.input :photo_src
      f.input :photo_src_url
    end

    f.has_many :location_maps, heading: 'Locations', sortable: :order, allow_destroy: true, new_record: true do |location_map|
      location_map.inputs :location, :show_order
    end

    f.actions
  end
end
