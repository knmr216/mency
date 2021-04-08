class AddOfficialSiteToBrands < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :official_site, :string
  end
end
