class CursosController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @matriculas = Matricula.where("user_id = ? AND estado_cd = ?", current_user, Matricula.estados(:confirmada)).order("created_at DESC")
  end
  
  def show
    @curso = Curso.find(params[:id])
  end
end
