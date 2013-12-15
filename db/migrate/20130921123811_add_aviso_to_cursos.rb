class AddAvisoToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :aviso, :string
  end
end
