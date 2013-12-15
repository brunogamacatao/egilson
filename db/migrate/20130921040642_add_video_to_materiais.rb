class AddVideoToMateriais < ActiveRecord::Migration
  def change
    add_column :materiais, :video, :string
  end
end
