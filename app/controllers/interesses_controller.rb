#encoding: utf-8
class InteressesController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    curso = Curso.find(params[:curso_id])
    
    if Interesse.where("curso_id = ? AND user_id = ?", curso, current_user).exists?
      redirect_to "/", alert: "Seu interesse neste curso já foi registrado"
    else
      Interesse.create!(curso: curso, user: current_user)
      redirect_to "/", notice: "Obrigado, seu interesse neste curso foi registrado"
    end
  end
end
