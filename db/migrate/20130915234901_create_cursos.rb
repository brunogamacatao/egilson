class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome
      t.string :imagem
      t.text :descricao
      t.boolean :inicio_previsto
      t.date :proxima_turma

      t.timestamps
    end
  end
end
