class AddProvinceToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :province, :string
  end
end
