class CompaniesController < ApplicationController
  impressionist actions: [:show], unique: [:session_hash]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    company = Company.new(company_params)
    if company.save
      current_user.update_attribute(:company_id, company.id)
      redirect_to company
    else
      render new
    end
  end

  def show
    @company = Company.find(params[:id])
    @view_count = @company.impressionist_count(:filter=>:session_hash)
  end

  private

  def company_params
    params.require(:company).permit(:name, :description)
  end

end
