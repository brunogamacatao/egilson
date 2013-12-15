#encoding: utf-8

class CursoMailer < ActionMailer::Base
  default from: "admin@brunocatao.com"
  
  def mensagem(matricula, mensagem)
    @matricula = matricula
    @mensagem  = mensagem
    
    print "Enviando mensagem para: #{matricula.user.email}"
    
    mail(to: matricula.user.email, subject: "Nova mensagem para você")
  end
end
