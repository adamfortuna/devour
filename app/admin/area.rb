ActiveAdmin.register Area do
  permit_params :name, :public

  form do |f|
    f.inputs 'Area' do
      f.input :name
      f.input :is_public
    end
    f.actions
  end

  before_filter :only => [:show, :edit, :update, :destroy] do
    @area = Area.friendly.find(params[:id])
  end
end
