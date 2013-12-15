ActiveAdmin.register Curso do
  collection_action :gerar_thumbnails do
    Curso.all do |curso| 
      curso.imagem.recreate_versions!
      curso.save!
    end
  end
  
  controller do
    def enviar_mensagem
      @curso = Curso.find(params[:curso_id])
      recipientes = []
      
      @curso.matriculas.each do |matricula|
        if matricula.user
          CursoMailer.mensagem(matricula, params[:curso][:mensagem]).deliver
          recipientes << matricula.user.username
        end
      end
      
      render :text => "Mensagens enviadas para: #{recipientes.join(', ')}"
    end
  end

  index do   
    column :imagem do |curso|
      image_tag curso.imagem_url(:mini_thumb) if curso.imagem? 
    end
    column :nome
    column :inicio_previsto
    column :created_at
    default_actions
  end
  
  show do
    render "/admin/curso"
  end
  
  action_item :only => :index do
    link_to 'Gerar Thumbnails', gerar_thumbnails_admin_cursos_path
  end
  
  action_item :only => :show do
    link_to 'Enviar Mensagem', '#', id: 'link_enviar_msg'
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs "Curso" do
      f.input :nome
      f.input :aviso
      f.input :imagem, :as => :file
      f.input :preco
      f.input :tem_promocao
      f.input :preco_promocional
      f.input :descricao
      f.input :ementa, as: :wysihtml5
      f.input :inicio_previsto
      f.input :proxima_turma
    end
    f.buttons
  end
end
