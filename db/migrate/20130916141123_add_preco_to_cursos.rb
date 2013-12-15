class AddPrecoToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :preco, :decimal, :precision => 8, :scale => 2, :default => 0.0
  end
end
