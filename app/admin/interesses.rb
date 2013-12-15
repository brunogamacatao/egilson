ActiveAdmin.register Interesse do
  index do
    column "Data", :created_at
    column("Aluno") { |interesse| interesse.user.try(:username) }
    column("Curso", :sortable => :curso_id) { |interesse| interesse.curso.nome }
    default_actions
  end
end
