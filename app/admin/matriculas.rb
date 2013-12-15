ActiveAdmin.register Matricula do
  index do
    column "Data", :created_at
    column("Aluno") { |matricula| matricula.user.try(:username) }
    column("Curso", :sortable => :curso_id) { |matricula| matricula.curso.nome }
    column "Estado", :sortable => :estado do |matricula| 
      status_tag(matricula.estado.to_s, [:warning, :ok, :error][matricula.estado_cd])
    end
    default_actions
  end
end
