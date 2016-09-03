ActiveAdmin.register Location do
  permit_params :name, :description, :short_description, :rating, :website, :review_url, :photo, :photo_src, :photo_src_url,
                address_attributes: [ :id, :street, :city, :region, :postal_code, :country, :lat, :lng, :_destroy ],
                location_social_sites_attributes: [:id, :location_id, :social_site_id, :url, :_destroy],
                area_ids: []

  index do
    selectable_column
    column :name
    column :short_description
    column :rating
    column :maps do |location|
      location.maps.count
    end
    actions
  end

  form(html: { multipart: true }) do |f|
    f.inputs 'Location' do
      f.input :name
      f.input :short_description
      f.input :description
      f.input :rating
      f.input :website
      f.input :review_url

      f.input :photo, :as => :file
      f.input :photo_src
      f.input :photo_src_url
    end

    f.inputs 'Areas' do
      f.input :areas, :as => :check_boxes
    end

    f.inputs 'Address' do
      f.semantic_fields_for :address, new_record: true do |a|
        a.input :street
        a.input :city
        a.input :region
        a.input :postal_code
        a.input :country
      end
    end

    f.has_many :location_social_sites, heading: 'Social Sites', allow_destroy: true, new_record: true do |location_social_site|
      location_social_site.inputs :social_site, :url
    end

    f.actions
  end

  show do
    @location = Location.friendly.find(params[:id])

    panel "Location" do
      attributes_table_for location do
        row :name
        row :short_description
        row :description
        row :rating
        row :website
        row :review_url
        row :photo do
          if !location.photo.blank?
            image_tag(location.photo.url(:thumb))
          end
        end
        row :photo_src
        row :photo_src_url
      end
    end

    panel "Areas" do
      location.areas.each do |area|
        attributes_table_for area do
          row :name
        end
      end
    end

    panel "Address" do
      attributes_table_for location.address do
        row :street
        row :city
        row :region
        row :postal_code
        row :country
        row :lat
        row :lng
      end
    end


    panel "Social Sites" do
      @location.location_social_sites.each do |lss|
        attributes_table_for lss do
          row :url
          attributes_table_for lss.social_site do
            row :name
          end
        end
      end
    end

    active_admin_comments
  end

  before_filter :only => [:show, :edit, :update, :destroy] do
    @location = Location.friendly.find(params[:id])
  end

  before_filter :only => [:new] do
    @location = Location.new
    @location.address = Address.new
  end
end
