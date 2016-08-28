ActiveAdmin.register Location do
  permit_params :name, :price, :description, :rating, :website, :review_url,
                address_attributes: [ :id, :street, :city, :region, :postal_code, :country, :lat, :lng, :_destroy ],
                area_ids: []


  form do |f|
    f.inputs 'Location' do
      f.input :name
      f.input :price
      f.input :description
      f.input :rating
      f.input :website
      f.input :review_url
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
        a.input :lat
        a.input :lng
      end
    end

    f.actions
  end

  show do
    panel "Location" do
      attributes_table_for location do
        row :name
        row :price
        row :description
        row :rating
        row :website
        row :review_url
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
