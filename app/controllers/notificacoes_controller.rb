class NotificacoesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    @notification_code = params[:id_pagseguro]
  end
  
  def create
    return unless request.post?
    
    email             = "brunogamacatao@gmail.com"
    token             = "8AE446E9204345D4B571A0C7CFFA9CC1"
    notification_code = params[:notificationCode]
    
    notification = PagSeguro::Notification.new(email, token, notification_code)
    matricula    = Matricula.find(notification.id)
    
    if notification.approved?
      matricula.estado = :confirmada
      MatriculaMailer.confirmacao(matricula).deliver
    elsif notification.cancelled? || notification.returned?
      matricula.estado = :cancelada
    end
    
    matricula.save!
    
    render :nothing => true
  end
end
