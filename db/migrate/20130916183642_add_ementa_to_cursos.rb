class AddEmentaToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :ementa, :text
  end
end
