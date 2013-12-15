require 'spec_helper'
include RequestHelpers

describe "EnviarMensagemCursos", :type => :feature do
  let(:authed_user) { create_logged_in_user }
  
  it "should login" do
    do_login
    page.should have_content "Painel Administrativo"
  end
  
  it "emails all users registered within a course with the desired message" do
    do_login
    
    # curso = create(:curso)
    # click_link "Cursos"
    # print page.html
   # click_link "Enviar Mensagem"
  end
  
  private 
  def do_login
    visit new_admin_user_session_path
    fill_in 'admin_user[username]', with: authed_user.username
    fill_in 'admin_user[password]', with: authed_user.password
    click_button 'Entrar'
  end
end
