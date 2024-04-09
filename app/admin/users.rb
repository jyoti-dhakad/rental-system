ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :first_name, :last_name, :email, :password_digest, :phone_number
  #
  actions :all, :except => [:new, :destroy, :edit]
  


  
end
