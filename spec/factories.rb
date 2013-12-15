#encoding: utf-8

FactoryGirl.define do
  factory :admin_user do
    email { "admino#{AdminUser.count}@example.com" }
    username "admin@example.com"
    password "password"
  end
  
  factory :user do
    username "Usuário"
    password "secret"
    email { "usuario#{User.count}@email.com" }
  end
  
  factory :matricula do
    user
    curso
  end
  
  factory :curso do
    nome "Nome do Curso"
    descricao "Descrição do curso"
    
    ignore do
      qtd_matriculas 5
    end
    
    after(:create) do |curso, evaluator|
      create_list(:matricula, evaluator.qtd_matriculas, curso: curso)
    end
  end
end