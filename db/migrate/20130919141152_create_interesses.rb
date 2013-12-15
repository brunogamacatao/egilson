class CreateInteresses < ActiveRecord::Migration
  def change
    create_table :interesses do |t|
      t.references :curso
      t.references :user

      t.timestamps
    end
    add_index :interesses, :curso_id
    add_index :interesses, :user_id
  end
end
