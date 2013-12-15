class CreateMateriais < ActiveRecord::Migration
  def change
    create_table :materiais do |t|
      t.references :curso
      t.string :nome
      t.string :url
      t.text :descricao

      t.timestamps
    end
    add_index :materiais, :curso_id
  end
end
