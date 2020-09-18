class Recipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :recipe 
    end 
  end
end
