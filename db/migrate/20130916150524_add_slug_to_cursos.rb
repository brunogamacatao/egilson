class AddSlugToCursos < ActiveRecord::Migration
  def change
    add_column :cursos, :slug, :string
    add_index :cursos, :slug, unique: true
  end
end
