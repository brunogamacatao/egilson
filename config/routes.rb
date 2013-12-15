#encoding: utf-8
Egilson::Application.routes.draw do
  # main page
  root :to => 'principal#index'
  
  # devise routes
  devise_for :users, path_names: {sign_in: 'entrar', sign_out: 'sair'},
                     controllers: {omniauth_callbacks: "omniauth_callbacks"}

  # active admin routes
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # pag_seguro routes
  resources :matriculas
  resources :notificacoes
  
  # general routes
  resources :cursos do
    resources :interesses
    post "/enviar_mensagem", to: "admin::cursos#enviar_mensagem"
  end
  
  get "principal/sobre", as: :sobre
  get "/detalhes/:id", to: 'principal#detalhe', as: :detalhe_curso
end
