ActiveAdmin.register Vehicle do

 
   permit_params :name, :model_number, :rent_price, :picture, :insurance
  #
  form do |f|
    f.inputs 'Vehicle Details' do
      f.input :name
      f.input :picture, as: :file 
      f.input :model_number
      f.input :rent_price
      f.input :insurance
      

    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column "Picture" do |vehicle|
      if vehicle.picture.present?
        image_tag(vehicle.picture.url, size: "130x100")
      else
        "No Image"
      end
    end
    column :model_number
    column :rent_price
    column :insurance

    actions
  end

  show do
    attributes_table do
      row :name
      row "Picture" do |vehicle|
        if vehicle.picture.present?
          image_tag(vehicle.picture.url, size: "100x100")
        else
          "No Image"
        end
      end
      row :model_number
      row :rent_price
      row :insurance
      
    end
  end
  
end
