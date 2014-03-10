# To change this template, choose Tools | Templates
# and open the template in the editor.

class MyDevise::RegistrationsController < Devise::RegistrationsController

  def create
    super

    if resource.save
      if params[:company_name]
        c = Company.new
        c.name = params[:company_name]
        c.description = params[:company_description]
        c.save!
        resource.company_id = c.id
        resource.save
      end
    end
  end
  
end
