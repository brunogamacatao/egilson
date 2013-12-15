class AddPromocaoToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :tem_promocao, :boolean, :default => false
    add_column :cursos, :preco_promocional, :decimal, :default => 0.0
  end
end
