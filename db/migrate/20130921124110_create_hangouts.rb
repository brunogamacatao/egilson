class CreateHangouts < ActiveRecord::Migration
  def change
    create_table :hangouts do |t|
      t.references :curso
      t.string :nome
      t.string :url
      t.text :descricao
      t.string :video

      t.timestamps
    end
    add_index :hangouts, :curso_id
  end
end
