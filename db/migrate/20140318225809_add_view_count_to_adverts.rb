class AddViewCountToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :view_count, :integer, :default => 0
    add_column :companies, :view_count, :integer, :default => 0
  end
end
