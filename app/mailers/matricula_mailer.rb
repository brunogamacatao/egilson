class MatriculaMailer < ActionMailer::Base
  default from: "admin@brunocatao.com"

  def confirmacao(matricula)
    @matricula = matricula
    mail to: matricula.user.email
  end
end
