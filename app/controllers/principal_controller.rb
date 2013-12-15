class PrincipalController < ApplicationController
  def index
  end
  
  def sobre
  end
  
  def detalhe
    @curso = Curso.find(params[:id])
  end
end
