class AddCompanyIdToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :company_id, :integer
  end
end
