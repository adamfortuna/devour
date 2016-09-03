ActiveAdmin.register SocialSite do
  permit_params :name

  form do |f|
    f.inputs 'Social Site' do
      f.input :name
    end
    f.actions
  end

  before_filter :only => [:show, :edit, :update, :destroy] do
    @social_site = SocialSite.friendly.find(params[:id])
  end
end
