class CreateMatriculas < ActiveRecord::Migration
  def change
    create_table :matriculas do |t|
      t.references :curso
      t.references :user
      t.integer :estado_cd

      t.timestamps
    end
    add_index :matriculas, :curso_id
    add_index :matriculas, :user_id
  end
end
