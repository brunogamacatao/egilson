class CreateAulas < ActiveRecord::Migration
  def change
    create_table :aulas do |t|
      t.references :curso
      t.string :nome
      t.string :url
      t.text :descricao
      t.string :video

      t.timestamps
    end
    add_index :aulas, :curso_id
  end
end
