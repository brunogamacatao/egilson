ActiveAdmin.register Aula do
  form do |f|
    f.inputs "Aula" do
      f.input :curso
      f.input :nome
      f.input :url
      f.input :video
      f.input :descricao, as: :wysihtml5
    end
    f.buttons
  end
end